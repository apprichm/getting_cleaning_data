# Getting and Cleaning Data CodeBook
**General.**  This CodeBook documents the Peer-graded Assignment for the Getting and Cleaning Data Course, part of the Coursera Data Science Course.
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can 
be used for later analysis.

**R Script File.** The *run_analysis.R* R script file performs the data preparation as described in the course project's instructions.  The R script then
executes 5 processes on the dataset:
1.  Merges the training and test data sets to create one unified data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Assigns descriptive activity names to name the activities in the data set.
4.  Labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Download the Dataset.**
Dataset Original Location:  https://archive-beta.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones
The dataset was downloaded and placed in the folder:  *UCI HAR Dataset*

**Assigning Variable Names to DataFrames in the dataset.**
- features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))<br/>
*Description: 561 Rows-2 Columns/The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.*
- activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))<br/>
*Description: 6 Rows-2 Columns/List of activities performed when the corresponding measurements were taken and its codes (labels)*
- subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject") <br/>
*Description: 2,947 Rows-1 Column/Contains test data of 9/30 volunteer test subjects being observed*
- x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions) <br/>
*Description: 2,947 Rows-561 Columns/Contains recorded features test data*
- y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code") <br/>
*Description: 2,947 Rows-1 Columns/Contains test data of activities’code labels*
- subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject") <br/>
*Description: 7,352 Rows-1 Column/Contains train data of 21/30 volunteer subjects being observed*
- x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions) <br/>
*Description: *
- y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code") <br/>
*Description: * 

 **[X] Step 1 - Merge the *training* and *test* datasets into one unified dataset.**
- X <- rbind(x_train, x_test)
- Y <- rbind(y_train, y_test)
- Subject <- rbind(subject_train, subject_test)
- Merged_Data <- cbind(Subject, Y, X)

 **[X] Step 2 - Extract only the measurements on the mean and standard deviation for each measurement.**
 
 
 **[X] Step 3 - Assign descriptive activity names to name the activities in the data set.**
 
 **[X] Step 4 - Label the data set with descriptive variable names.**
 
