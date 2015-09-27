## READ FEATURES
## reads the names of the features from the 'features.txt' file
featuresList <- read.table("./data/UCI HAR Dataset/features.txt",col.names=c("number","name"),stringsAsFactors=FALSE)
## creates a vector with the features names to be used later as column headers when reading
## the data with the observations
features <- as.vector(featuresList$name)

## READ ACTIVITIES
## reads the list with the activities names corresponding to the numbers
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",col.names=c("activityNumber","activityName"),stringsAsFactors=FALSE)

## READ TRAIN DATA
## reads file with the id of the Subjects and name the column id
subjectsTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",col.names=c("id"))
## class(subjectsTrain$id)

## reads file with the identified of the Activity and name the column activity
activitiesTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt",col.names=c("activityNumber"))
## colnames(activitiesTrain)

## reads file with the 561 features for each data point and give the columns the names of the features
## while already naming the column variables with the appropriate measurement name (STEP 4)
dataTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt",col.names=features,stringsAsFactors=FALSE)

## ads the id of the subjects and the number of the activity to the measurements data
## by adding two new columns to the dataTrain data table
dataTrain <- cbind(dataTrain,subjectsTrain,activitiesTrain)

## READ TEST DATA
## reads file with the id of the Subjects and name the column id
subjectsTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",col.names=c("id"))
## class(subjectsTest$id)

## reads file with the identified of the Activity and name the column activity
activitiesTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt",col.names=c("activityNumber"))
## colnames(activitiesTrain)

## reads file with the 561 features for each data point and give the columns the names of the features
## while already naming the column variables with the appropriate measurement name (STEP 4)
dataTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt",col.names=features,stringsAsFactors=FALSE)

## ads the id of the subjects and the number of the activity to the measurements data
## by adding two new columns to the dataTest data table
dataTest <- cbind(dataTest,subjectsTest,activitiesTest)

## STEP 1
## Merges the training and the test sets to create one data set
## by using rbind function
dataTotal <- rbind(dataTrain,dataTest)

## STEP 2
## Extracts only the measurements on the mean and standard deviation for each measurement
## uses function grepl to extract only those measures that contain 
## <any number of characters> followed by "mean" or "std" followed by <any number of characters>
featuresMeanStDev <- grepl("(.*)mean\\(\\)|std\\(\\)(.*)",features)
## stores the number of features in the variable noFeatures
noFeatures <- length(features[featuresMeanStDev])
## subsets only the data with the features we are looking for into dataTotalMeanStDev
dataTotalMeanStDev <- dataTotal[,featuresMeanStDev]

## STEP 3
## Uses descriptive activity names to name the activities in the data set
## merges the total data and the activity data tables
## the result adds the names of the activities to the total data in a new separate column
dataTotalMeanStDev <- merge(dataTotalMeanStDev,activityLabels,by.y="activityNumber")

## STEP 4
## Appropriately labels the data set with descriptive variable names
## DONE at reading - see above

## STEP 5
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## uses 'aggregate' function to apply the mean function over each Activity and each individual subject ID
## the result is stored in 'tidyData'
tidyData <- aggregate(dataTotalMeanStDev[,2:noFeatures],list(ID = dataTotalMeanStDev$id,Activity=dataTotalMeanStDev$activityName),mean)
## writes the tidyData file
write.table(tidyData,file="./data/tidy_data.txt",row.names=FALSE)


