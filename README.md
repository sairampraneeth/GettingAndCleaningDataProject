# SAIRAM PRANEETH VEGESANA - Getting and Cleaning Data

## Github Repository Files
The Repository contains the following files :- 

1. "run_analysis.R" script which downloads the data, cleans it and then outputs a tidy data set in a file named "TidyData.txt"

2. Readme file named "README.md" for instructions on how to run the "run_analysis.R" script.

3. "CodeBook.md" file which describes the data sets as well as the transformations performed on the data sets to acquire the tidy data set.

## Steps Required for getting clean and tidy data set

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Input Data
Input data is not required for the script as the URL link of the Dataset is hardcoded in the R script.
DataSet Link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Instructions for running the Script
Download the "run_analysis.R" script and run it in the current working directory of R using the source("run_analysis.R") command which will automatically do the following:

1. Downloads the DataSet from the above link and then unzips the data automatically.

2. Merges and Cleans the Dataset as per the requirements mentioned above.

3. Writes the Tidy Dataset to a new file called "TidyData.txt" which will appear in the current working directory of R.

## Output Data
The Output File of the tidy Dataset is "run_analysis.R"
