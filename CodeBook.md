---
title: "CodeBook"
author: "Nadina Busuioc"
date: "September 27, 2015"
output: html_document
---

## Data description
The data stored in the output file *tidyData.txt* which is generated after running the *run_analysis.R* script, has the following attributes:
* ID: each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* Activity: each row identifies the name of the activity performed by the subject. It can be one of the following values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* A list of features that describe measurements performed for each subject performing an activity, describing the acceleration sample (three axis) captured at a frequency of 50Hz and the angular velocity sample (three axis) captured at a frequency of 50Hz:
+ tBodyAcc-mean()-X
+ tBodyAcc-mean()-Y
+ tBodyAcc-mean()-Z
+ tBodyAcc-std()-X
+ tBodyAcc-std()-Y
+ tBodyAcc-std()-Z
+ tGravityAcc-mean()-X
+ tGravityAcc-mean()-Y
+ tGravityAcc-mean()-Z
+ tGravityAcc-std()-X
+ tGravityAcc-std()-Y
+ tGravityAcc-std()-Z
+ tBodyAccJerk-mean()-X
+ tBodyAccJerk-mean()-Y
+ tBodyAccJerk-mean()-Z
+ tBodyAccJerk-std()-X
+ tBodyAccJerk-std()-Y
+ tBodyAccJerk-std()-Z
+ tBodyGyro-mean()-X
+ tBodyGyro-mean()-Y
+ tBodyGyro-mean()-Z
+ tBodyGyro-std()-X
+ tBodyGyro-std()-Y
+ tBodyGyro-std()-Z
+ tBodyGyroJerk-mean()-X
+ tBodyGyroJerk-mean()-Y
+ tBodyGyroJerk-mean()-Z
+ tBodyGyroJerk-std()-X
+ tBodyGyroJerk-std()-Y
+ tBodyGyroJerk-std()-Z
+ tBodyAccMag-mean()
+ tBodyAccMag-std()
+ tGravityAccMag-mean()
+ tGravityAccMag-std()
+ tBodyAccJerkMag-mean()
+ tBodyAccJerkMag-std()
+ tBodyGyroMag-mean()
+ tBodyGyroMag-std()
+ tBodyGyroJerkMag-mean()
+ tBodyGyroJerkMag-std()
+ fBodyAcc-mean()-X
+ fBodyAcc-mean()-Y
+ fBodyAcc-mean()-Z
+ fBodyAcc-std()-X
+ fBodyAcc-std()-Y
+ fBodyAcc-std()-Z
+ fBodyAccJerk-mean()-X
+ fBodyAccJerk-mean()-Y
+ fBodyAccJerk-mean()-Z
+ fBodyAccJerk-std()-X
+ fBodyAccJerk-std()-Y
+ fBodyAccJerk-std()-Z
+ fBodyGyro-mean()-X
+ fBodyGyro-mean()-Y
+ fBodyGyro-mean()-Z
+ fBodyGyro-std()-X
+ fBodyGyro-std()-Y
+ fBodyGyro-std()-Z
+ fBodyAccMag-mean()
+ fBodyAccMag-std()
+ fBodyBodyAccJerkMag-mean()
+ fBodyBodyAccJerkMag-std()
+ fBodyBodyGyroMag-mean()
+ fBodyBodyGyroMag-std()
+ fBodyBodyGyroJerkMag-mean()
+ fBodyBodyGyroJerkMag-std()
* The value of each row represents the mean of the observations for each measure for the same subject ID and the same Activity.

