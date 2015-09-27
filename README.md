# Getting and Cleaning Data - Course project

## Summary
The following repository contains the script necessary to clean and preapare the raw motion data collected from a Samsung Galaxy S smartphone for further analysis.

This script is intended to be used with the following data set:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

For an extended description of the dataset please see:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## How to run
1. Clone this repo to a local folder
2. Set your R working directory to the folder created in the previous step
3. Download the raw dataset from the above location to the folder created in step 1
2. Use your platform tool to unzip the contents
3. Rename the folder created in the previous step from "FUCI HAR Dataset" to "data"
4. Run the run_analysis.R script from the current working directory

## Output
Two files will be created

### fuci_har_dataset.txt
This file contains the cleaned data ready for further analysis. It is a space separated table that can be read using the read.table R function.

### fuci_har_dataset_summarised_means.txt
This file contains is a summarised version of "fuci_har_dataset.txt" grouped by "Activity" and
"Subject" containig the mean of every motion variable.
