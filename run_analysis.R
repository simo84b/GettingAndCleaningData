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

extractAndRenameTestData<-function(){
    
    #first of all, we read the files containing the descriptions of activities performed and features measured
    #we also read the list of activities and the subjects who performed them
    activityLabels <- read.table("activity_labels.txt", col.names=c("activity_id","activityDescription"))
    features <- read.table("features.txt", col.names=c("feature_id","featureDescription"))
    features$featureDescription <- gsub("\\-|\\(|\\)|\\,","",as.character(features$featureDescription))
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

extractAndRenameTrainData<-function(){
    
    #first of all, we read the files containing the descriptions of activities performed and features measured
    #we also read the list of activities and the subjects who performed them
    activityLabels <- read.table("activity_labels.txt", col.names=c("activity_id","activityDescription"))
    features <- read.table("features.txt", col.names=c("feature_id","featureDescription"))
    features$featureDescription <- gsub("\\-|\\(|\\)|\\,","",as.character(features$featureDescription))
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

mergeAndSelect <- function(testDataComplete, trainDataComplete){
    
    dataset <- rbind(testDataComplete,trainDataComplete)
    meanAndStdData <- cbind(dataset$activity_id, dataset$activityDescription, dataset$subject_id, dataset[,grep(paste(c("mean","std"), collapse="|"),colnames(dataset),ignore.case=TRUE)])
    colnames(meanAndStdData)[0:3] <- c("activity_id","activityDescription","subject_id")
    cleandataset <- summarise_each(group_by(meanAndStdData, activity_id, activityDescription, subject_id), funs(mean))
    cleandataset
}

run_analysis <- function(){
    library(dplyr)
    setupAndDownload("cleandata","https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","UCIHARDataset.zip")
    testdata <- extractAndRenameTestData()
    traindata <- extractAndRenameTrainData()
    cleandata <- mergeAndSelect(testdata, traindata)
    write.table(cleandata, file="../cleandataset.txt", row.name=FALSE)
}