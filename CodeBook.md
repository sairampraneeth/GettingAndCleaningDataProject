# Getting and Cleaning Data Project

## Original DataSet and DataSet Description

DataSet : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

DataSet Description : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Files and Descriptions

features.txt : Contains the Feature Names for all the 561 Features in the Data set

activity_labels.txt : Contains The Activity Names corresponding to each Activity Label

train/x_train.txt : Contains the Values of the Features for the Training Set

train/y_train.txt : Contains the Values of the Labels for the Training Set

test/x_test.txt : Contains the Values of the Features for the Testing Set

test/y_test.txt : Contains the Values of the Labels for the Testing Set

train/subject_train.txt : Contains the Subject who performed the experiment in each row for the Training Set

test/subject_test.txt : Contains the Subject who performed the experiment in each row for the Testing Set

## Features

The Features in the Tidy table Contains are a combination of the following signals and their estimates :

### Signals
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

### Estimates
Each Signal contains the following two estimates : mean() and std().

The Tidy Dataset finally contains 66 Features, 1 Column for Activity Names and 1 Column for Subject IDs.

## Transformation Steps

The Transformation Stage consists of 5 steps :

1. Merge the training and the test sets to create one data set.

2. Extract only the measurements on the mean and standard deviation for each measurement.

3. Use descriptive activity names to name the activities in the data set

4. Appropriately label the data set with descriptive variable names.

5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Working of the R Script

1. Checks for the libraries "reshape2" and "data.table"
2. Download and Unzip the Initial Dataset
3. Merge the Feature Data of both the Training and Testing Set. Then it assigns Feature Name to each Feature Variable and then it only selects Features Pertaining to mean() and std()
4. Merge the Label Data of both the Training and Testing Set. The Column name is Activity.
5. Merge the Subject Data of both the Training and Testing Set
6. Merge the Features, Activity and Subject Columns
7. Substitute Each Activity Number in Activity Column with corresponding Activity Name
8. Collapse the Datatable into a table where each row contains the average of all Features for a Given Activity and a Given Subject.
9. Writes the New Tidy Table to a file called "TidyData.txt" using the 'write.table' function whilst setting the 'row.names' attribute of 'write.table' function to FALSE.
