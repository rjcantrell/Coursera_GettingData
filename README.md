RUN_ANALYSIS.R  v1.0
Author: RJ Cantrell (rj@rjcantrell.com)
Date: June 22, 2014

Introduction
------------
This is my submission for the Course Project in Johns Hopkins' "Getting and Cleaning Data" MOOC, located at https://class.coursera.org/getdata-004/.

Per the project description: "The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject."

Usage
-----
Run "run_analysis.r" in your R client of choice. It will gather any necessary data (e.g., downloading the initial zip file if required), and will output the tidy data set arising from this to a pre-determined text file name.

Input
-----
None required.

Output
------
One text file named "Summarized_HAR_Data.txt", as written by the write.table() function, including header row. The table contains a numeric subject ID, a description of the body position of the subject (see also activity_labels.txt inside the HAR archive), and a range of numeric values representing the mean value of each of the means and standard deviations recorded in the original testing and training datasets, per subject and body position.

To read this data back into R for further processing, simply call read.table("Summarized_HAR_Data.txt", header = TRUE).

Detail
------
For more information, read the comments in run_analysis.r, but in brief, the script does the following:
- checks whether the source dataset exists in the working directory.
- if necessary, downloads the source dataset.
- unzips the source dataset, and keeps the name of the subdirectory to which it was extracted.
- reads data common to both the test and training datasets (feature names, activity labels).
- reads the test dataset in three distinct parts, per the source's original file structure (X, Y, and subject IDs).
- reads the training dataset in three distinct parts, per the source's original file structure (X, Y, and subject IDs).
- combines the test dataset into a single table.
- combines the training dataset into a single table.
- combines the test and training datasets into a single table.
- retrieves a list of all the columns in the dataset representing means and standard deviations.
- subsets the dataset to only those columns (plus subject ID and activity).
- melts the dataset from a wide format to a long format.
- casts the long-formatted dataset to an AGGREGATED wide format, per subject and activity.
- cleans up the column names to be more-easily read.