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
tidydata.csv|Obtained tidy Dataset
tidydatameans.csv|Second tidy Dataset obtained from tidydata.csv by grouping subjects and activities

## Instruction List

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
