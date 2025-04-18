# Getting and Cleaning Data Coursera Course Project:

Final Course Project of "Getting and Cleaning Data" Coursera CourseThe purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Problem Summary

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained [Here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the data for our project [Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Repository Contents

File Name | Description
----------|------------
README.md|Documentation explaining the project and how to use files contained in the repository.
UCI HAR Dataset/| File where is the raw data and its own Codebook
CodeBook.md|Codebook where is detailed the features inside tidydata.csv and tidydatameans.csv
run_analysis.R|R Script where is processed the raw data to obtained the tidy data following the Instruction List.
tidydata.txt|Obtained tidy Dataset
tidydatameans.txt|Second tidy Dataset obtained from tidydata.csv by grouping subjects and activities

## Instruction List

1. Merges the training and the test sets to create one data set.

> I use `read.table`  to load the raw data, then `cbind` to merge the train and test columns and finally `rbind` to merge the 2 datasets. 

2. Extracts only the measurements on the mean and standard deviation for each measurement.

> I use `grepl` to filter the columns with mean and std.

3. Uses descriptive activity names to name the activities in the data set

> First, I load the activity names with `read.table` and finally, `merge` to inner join the activity names with the dataset.

4. Appropriately labels the data set with descriptive variable names.

> I use `gsub`,`tolower` and `sub` to set the appropriate labels following the rules showed in class.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

> I use pipes and the functions `group_by` and `summarise_at` in order to get the second tidy dataset.
