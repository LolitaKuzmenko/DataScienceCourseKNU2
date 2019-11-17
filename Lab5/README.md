# Lab5

This repository contains R scripts to produce a tidy data set from the University of California Irvine (UCI) Human Activity Recognition Using Smartphones Data Set.  The UCI dataset was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  A full description is available at the source:

  *[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

## Requirements

The requirements are to create a R script that does the following:

  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement.
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names.
  * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## R Code

The run_analysis.R file within this repository contains the R code to produce the tidy data set called tidy_dataset.csv.  The R code assumes that the source data has been downloaded from the [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and saved to the current working directory and maintains the subdirectory from the UCI download.  

Source the R code with the following command:

```R
source("run_analysis.R")
```

The tidy data set can be loaded back into R using the command:

```R
tidy_data <- read.csv("tidy_dataset.csv")
```

## CodeBook

A CodeBook relating to the tidy dataset produced by the run_analysis.R script is also available in this repository.  