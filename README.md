# Getting-and-Cleaning-Data-Week-4-Assignment
This repository contains the submission for the assignment for week 4 of Getting and Cleaning Data Coursera course.

This repository contains the R code, codebook, and tidy data set for the assignment.

## Files

README.md - This file

CodeBook.md - Describes the how to use the run_analysis.R. In addition it dscribes the variables, data, and transformations that were performed to clean up the data.

run_analysis.R - Contains all the code to perform the analyses described in the 5 steps. This R script can be run by importing it into RStudio. 

# Data description
The variables in the dataset are sensor signals measured by a smartphone mounted on the waists of 30 subjects. The variable in the data Y indicates one of 5 activity types that the subjects performed while being recorded.

# Code explanation

run_analysis.R combines training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

# Newly generated dataset: tidydata.txt

As a last step, run_analysis.R generates a second, independent tidy data set ("tidydata.txt") with the average and standard deviation of each variable for each activity and each subject. Each row of the dataset is an average of each activity type for all subjects.
