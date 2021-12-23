#### Getting and Cleaning Data Course Project
#### Dataset Orginal Location:  https://archive-beta.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones
#### Filename:  run_analysis.R 
#### 
####  You will be required to submit: 
####  1.  A tidy data set as described below 
####  2.  A link to a Github repository with your script for performing the analysis (Insert link here:          )
####  3.  A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
####      You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
####
#### You should create one R script called run_analysis.R that does the following. 
#### 1.  Merges the training and the test sets to create one data set.
#### 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
#### 3.  Uses descriptive activity names to name the activities in the data set
#### 4.  Appropriately labels the data set with descriptive variable names. 
#### 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
####
#### Preparation
#### Loading Required Packages
install.packages("dplyr")
library(dplyr)
####
#### Accessing the dataset(s) by setting wd
#### E:\R Programming\UCI HAR Dataset
setwd("E:/R Programming")
####
#### Assigning all data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
####
#### Step 1: Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)
####
#### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
####
#### Step 3: Uses descriptive activity names to name the activities in the data set.
TidyData$code <- activities[TidyData$code, 2]
####
#### Step 4: Appropriately labels the data set with descriptive variable names.
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))
####
####  Step 5: From the data set in step 4, creates a second, write an independent tidy data set with the 
####  average of each variable for each activity and each subject.
####
FinalData <- TidyData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
####
####  Final Stage Check
str(FinalData)



