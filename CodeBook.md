#Data Dictionary - Wearable Computing

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The data elaborated using run_analysis.R have selected only the mean and standard deviation of the variables mentioned above, and have been grouped by activity and subject taking for each of the variables their average value.

| Variable Name   |      Description      |  Values (if applicable) |
|-----------------|:---------------------:|------------------------:|
| activity_id        | unique id the activity performed | from 1 to 6 |
| activityDescription | description of the activity performed   | <ul><li>1: WALKING</li><li>2: WALKING_UPSTAIRS</li><li>3: WALKING_DOWNSTAIRS</li><li>4: SITTING</li><li>5: STANDING</li><li>6: LAYING</li></ul> |
| subject_id | unique id of the subject who performed the activity | from 1 to 30 |
| tBodyAccmeanX | mean of body acceleration signal on the X-axis |  |
| tBodyAccmeanY | mean of body acceleration signal on the Y-axis |  |
| tBodyAccmeanZ | mean of body acceleration signal on the Z-axis |  |
| tBodyAccstdX | standard deviation of body acceleration signal on the X-axis |  |
| tBodyAccstdY | standard deviation of body acceleration signal on the Y-axis |  |
| tBodyAccstdZ | standard deviation of body acceleration signal on the Z-axis |  |
| tGravityAccmeanX | mean of gravity acceleration signal on the X-axis |  |
| tGravityAccmeanY | mean of gravity acceleration signal on the Y-axis |  |
| tGravityAccmeanZ | mean of gravity acceleration signal on the Z-axis |  |
| tGravityAccstdX | standard deviation of gravity acceleration signal on the X-axis |  |
| tGravityAccstdY | standard deviation of gravity acceleration signal on the Y-axis |  |
| tGravityAccstdZ | standard deviation of gravity acceleration signal on the Z-axis |  |
| tBodyAccJerkmeanX | mean of jerk signal (derived from body acceleration) on the X-axis |  |
| tBodyAccJerkmeanY | mean of jerk signal (derived from body acceleration) on the Y-axis |  |
| tBodyAccJerkmeanZ | mean of jerk signal (derived from body acceleration) on the Z-axis |  |
| tBodyAccJerkstdX | standard deviation jerk signal (derived from body acceleration) on the X-axis |  |
| tBodyAccJerkstdY | standard deviation jerk signal (derived from body acceleration) on the Y-axis |  |
| tBodyAccJerkstdZ | standard deviation jerk signal (derived from body acceleration) on the Z-axis |  |
| tBodyGyromeanX | mean of jerk signal (derived from angular velocity) on the X-axis |  |
| tBodyGyromeanY | mean of jerk signal (derived from angular velocity) on the Y-axis |  |
| tBodyGyromeanZ | mean of jerk signal (derived from angular velocity) on the Z-axis |  |
| tBodyGyrostdX | standard deviation of jerk signal (derived from angular velocity) on the X-axis |  |
| tBodyGyrostdY | standard deviation of jerk signal (derived from angular velocity) on the Y-axis |  |
| tBodyGyrostdZ | standard deviation of jerk signal (derived from angular velocity) on the Z-axis |  |
| tBodyGyroJerkmeanX | mean of jerk signal at X-axis |  |
| tBodyGyroJerkmeanY | mean of jerk signal at Y-axis |  |
| tBodyGyroJerkmeanZ | mean of jerk signal at Z-axis |  |
| tBodyGyroJerkstdX | standard deviation of jerk signal at X-axis |  |
| tBodyGyroJerkstdY | standard deviation of jerk signal at Y-axis |  |
| tBodyGyroJerkstdZ | standard deviation of jerk signal at Z-axis |  |
| tBodyAccMagmean | mean of magnitude of body acceleration |  |
| tBodyAccMagstd | standard deviation of magnitude of body acceleration |  |
| tGravityAccMagmean | mean of magnitude of gravity acceleration |  |
| tGravityAccMagstd | standard deviation of magnitude of gravity acceleration |  |
| tBodyAccJerkMagmean | mean of magnitude jerk signal (derived from body acceleration) |  |
| tBodyAccJerkMagstd | standard deviation of magnitude jerk signal (derived from body acceleration) |  |
| tBodyGyroMagmean | mean of magnitude of angular velocity |  |
| tBodyGyroMagstd | standard deviation of magnitude of angular velocity |  |
| tBodyGyroJerkMagmean | mean of magnitude jerk signal (derived from angular velocity) |  |
| tBodyGyroJerkMagstd | standard deviation of magnitude jerk signal (derived from angular velocity) |  |
| fBodyAccmeanX | Fast Fourier Transform of mean body acceleration on the X-axis |  |
| fBodyAccmeanY | Fast Fourier Transform of mean body acceleration on the Y-axis |  |
| fBodyAccmeanZ | Fast Fourier Transform of mean body acceleration on the Z-axis |  |
| fBodyAccstdX | Fast Fourier Transform of standard deviation body acceleration on the X-axis |  |
| fBodyAccstdY | Fast Fourier Transform of standard deviation body acceleration on the Y-axis |  |
| fBodyAccstdZ | Fast Fourier Transform of standard deviation body acceleration on the Z-axis |  |
| fBodyAccJerkmeanX | Fast Fourier Transform of mean jerk signal (derived from body acceleration) at X- axis |  |
| fBodyAccJerkmeanY | Fast Fourier Transform of mean jerk signal (derived from body acceleration) at Y- axis |  |
| fBodyAccJerkmeanZ | Fast Fourier Transform of mean jerk signal (derived from body acceleration) at Z- axis |  |
| fBodyAccJerkstdX | Fast Fourier Transform of standard deviation jerk signal (derived from body acceleration) at X- axis |  |
| fBodyAccJerkstdY | Fast Fourier Transform of standard deviation jerk signal (derived from body acceleration) at Y- axis |  |
| fBodyAccJerkstdZ | Fast Fourier Transform of standard deviation jerk signal (derived from body acceleration) at Z- axis |  |
| fBodyGyromeanX | Fast Fourier Transform of mean angular velocity at X-axis |  |
| fBodyGyromeanY | Fast Fourier Transform of mean angular velocity at Y-axis |  |
| fBodyGyromeanZ | Fast Fourier Transform of mean angular velocity at Z-axis |  |
| fBodyGyrostdX | Fast Fourier Transform of standard deviation angular velocity at X-axis |  |
| fBodyGyrostdY | Fast Fourier Transform of standard deviation angular velocity at Y-axis |  |
| fBodyGyrostdZ | Fast Fourier Transform of standard deviation angular velocity at Z-axis |  |
| fBodyAccMagmean | Fast Fourier Transform of mean magnitude of body acceleration |
| fBodyAccMagstd | Fast Fourier Transform of standard deviation magnitude of body acceleration |
| fBodyBodyAccJerkMagmean | Fast Fourier Transform of mean magnitude of jerk signal (derived from body acceleration) |  |
| fBodyBodyAccJerkMagstd | Fast Fourier Transform of standard deviation magnitude of jerk signal (derived from body acceleration) |  |
| fBodyBodyGyroMagmean | Fast Fourier Transform of mean magnitude of angular velocity |  |
| fBodyBodyGyroMagstd | Fast Fourier Transform of standard deviation magnitude of angular velocity |  |
| fBodyBodyGyroJerkMagmean | Fast Fourier Transform of mean magnitude of jerk signal (derived from angular velocity) |  |
| fBodyBodyGyroJerkMagstd | Fast Fourier Transform of standard deviation magnitude of jerk signal (derived from angular velocity) |  |
