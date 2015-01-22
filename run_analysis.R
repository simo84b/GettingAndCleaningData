#This is a generic and reusable function, whose purpose is to create a working
#directory and download a file from the internet
setupAndDownload <- function(folderName, url, destFile, isZipped=TRUE){
  
  #Create a dedicated working directory
  if(!file.exists(folderName)){
    dir.create(folderName)
  }
  setwd(paste("./",folderName, sep=""))
  
  #Download file
  download.file(url, destfile=destFile)
  dateDownloaded <- date()
  
  #If the downloaded file is zipped, unzip it and change working directory
  if(isZipped){
    unzip(destFile)
    setwd(list.dirs(recursive=FALSE))
  }
  dateDownloaded
}

#This function extracts and prepares test data for merging with the train data
extractAndRenameTestData<-function(){
    
    #first of all, we read the files containing the descriptions of activities performed and features measured
    #(giving them appropriate column names)
    activityLabels <- read.table("activity_labels.txt", col.names=c("activity_id","activityDescription"))
    features <- read.table("features.txt", col.names=c("feature_id","featureDescription"))
    
    #the features data need to be cleaned before using them as column names, so we use gsub to remove the
    #following characters: -(),
    features$featureDescription <- gsub("\\-|\\(|\\)|\\,","",as.character(features$featureDescription))
    
    #we also read the list of activities and the subjects who performed them
    testActivityId <- read.table("./test/y_test.txt", col.names=c("activity_id"))
    subjects <- read.table("./test/subject_test.txt", col.names="subject_id")
    
    #Now we read the test data, giving as column names the descriptions we found in the file features.txt
    testData <- read.table("./test/X_test.txt", col.names=features$featureDescription)
    
    #In the test data there is no mention of the activity performed or the subject who performed it
    #Therefore, we need to add the activity and subject id's to the test data
    dataWithId <- cbind(testActivityId, subjects, testData)
    
    #Finally, we merge test data with activity labels to get activity descriptions
    testDataComplete <- merge(activityLabels,dataWithId,by.x="activity_id",by.y="activity_id",all=TRUE)
    
    testDataComplete
}

#This function extracts and prepares train data for merging with the test data
extractAndRenameTrainData<-function(){
    
    #first of all, we read the files containing the descriptions of activities performed and features measured
    #(giving them appropriate column names)
    activityLabels <- read.table("activity_labels.txt", col.names=c("activity_id","activityDescription"))
    features <- read.table("features.txt", col.names=c("feature_id","featureDescription"))
    
    #the features data need to be cleaned before using them as column names, so we use gsub to remove the
    #following characters: -(),
    features$featureDescription <- gsub("\\-|\\(|\\)|\\,","",as.character(features$featureDescription))
    
    #we also read the list of activities and the subjects who performed them
    trainingActivityId <- read.table("./train/y_train.txt", col.names=c("activity_id"))
    subjects <- read.table("./train/subject_train.txt", col.names="subject_id")
    
    #Now we read the train data, giving as column names the descriptions we found in the file features.txt
    trainData <- read.table("./train/X_train.txt", col.names=features$featureDescription)
    
    #In the train data there is no mention of the activity performed or the subject who performed it
    #Therefore, we need to add the activity and subject id's to the test data
    dataWithId <- cbind(trainingActivityId, subjects, trainData)
    
    #Finally, we merge train data with activity labels to get activity descriptions
    trainDataComplete <- merge(activityLabels,dataWithId,by.x="activity_id",by.y="activity_id",all=TRUE)
    
    trainDataComplete
}

#This is the last step, where train data and test data are merged and we create a second dataset
#with the mean of every measure column
mergeAndSelect <- function(testDataComplete, trainDataComplete){
    
    #Merging (using rbind)
    dataset <- rbind(testDataComplete,trainDataComplete)
    
    #Here we select only the measure columns that contain the words "mean" or "std", by using the grep function (excluding meanFreq, which is
    #the weighted average of the frequency components)
    #Then we append to the result dataset the activity_id, activityDescription and subject_id columns with cbind
    meanAndStdData <- cbind(dataset$activity_id, dataset$activityDescription, dataset$subject_id, dataset[,grep(paste(c("meanX","meanY","meanZ","std","Magmean$"), collapse="|"),colnames(dataset),ignore.case=TRUE)])
    
    #With the last function we lost the correct names of the first three columns, which need to be renamed
    colnames(meanAndStdData)[0:3] <- c("activity_id","activityDescription","subject_id")
    
    #Last step - summarise_each calculates the average of each variable for each activity and each subject
    cleandataset <- summarise_each(group_by(meanAndStdData, activity_id, activityDescription, subject_id), funs(mean))
    cleandataset
}

#This is the only function that needs to be called - you can customize your output by editing
#the setupAndDownload parameters, and the filename of write.table
run_analysis <- function(){
    library(dplyr)
    dateDownloaded <- setupAndDownload("cleandata","https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","UCIHARDataset.zip")
    testdata <- extractAndRenameTestData()
    traindata <- extractAndRenameTrainData()
    cleandata <- mergeAndSelect(testdata, traindata)
    write.table(cleandata, file="../cleandataset.txt", row.name=FALSE)
    write.table(dateDownloaded, file="../dateDownloaded.txt")
}