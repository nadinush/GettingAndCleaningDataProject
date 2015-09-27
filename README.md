---
title: "README"
author: "Nadina Busuioc"
date: "September 27, 2015"
output: html_document
---

# GettingAndCleaningDataProject
Course project for the Getting And Cleaning Data course as part of the Data Science 
specialization.

## General script description
There is one script called 'run_analysis.R' that can be used to solve the questions of 
the project for the Getting And Cleaning Data course.

The script reads the data from the following files stored in the local directory:
* features.txt: the list of features of the data
* activity_labels.txt: the descriptive lables of the activities each subject performed
* subject_train.txt: the ID of each subject in the Train group that corresponds to 
each measurement
* y_train.txt: the number of the respective activity for which the variables were 
measured for the Train group
* X_train.txt: the measurements done for the subjects in the Train group
* subject_test.txt: the ID of each subject in the Test group that corresponds to each 
measurement
* y_test.txt: the number of the respective activity for which the variables were 
measured for the Test group
* X_test.txt: the measurements done for the subjects in the Test group

## Description of functions used and operations performed
### Step 1
The script merges the training and the test data after reading to create one data set by using the *rbind* function:
```
dataTotal <- rbind(dataTrain,dataTest)
```

### Step 2
The script extracts only the measurements on the mean and standard deviation for each measurement by using the function *grepl* to extract only those measures that contain any number of characters followed by "mean" or "std" followed by any number of characters:
```
featuresMeanStDev <- grepl("(.*)mean|std(.*)",features)
```
This is possible due to the way the data was read in the first place. Initially the features list was read separately and then assigned as column names directly to the measurements data at reading:

1. Reading features list and transforming the names into a vector using *as.vector* (to be able to use it later as input in the *read.table* function as column names):
```
featuresList <- read.table("./data/UCI HAR Dataset/features.txt",col.names=c("number","name"),stringsAsFactors=FALSE)
features <- as.vector(featuresList$name)
```
2. Assigning the column names to be the names of the features directly when reading both the Train data and the Test data
```
dataTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt",col.names=features,stringsAsFactors=FALSE)
dataTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt",col.names=features,stringsAsFactors=FALSE)
```

### Step 3
Uses descriptive activity names to name the activities in the data set by merging the total data and the activity data tables into one, using the *merge* function and indicating the activityNumber as the column to merge by. The result adds the names of the activities to the total data in a new separate column.
```
dataTotalMeanStDev <- merge(dataTotalMeanStDev,activityLabels,by.y="activityNumber")
```

### Step 4
Appropriately labels the data set with descriptive variable names, by assigning the column names to be the names of the features directly when reading both the Train data and the Test data. See Step 2.

### Step 5
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. It uses the *aggregate* function to apply the mean function over each Activity and each individual subject ID. The result is stored in 'tidyData'.
```
tidyData <- aggregate(dataTotalMeanStDev[,2:noFeatures],list(ID = dataTotalMeanStDev$id,Activity=dataTotalMeanStDev$activityName),mean)
```
It then writes the resulting tidy data table into a text file called 'tidyData.txt':
```
write.table(tidyData,file="./data/tidy_data.txt",row.names=FALSE)
```
