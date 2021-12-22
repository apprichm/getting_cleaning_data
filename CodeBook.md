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
