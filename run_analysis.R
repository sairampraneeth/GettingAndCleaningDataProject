# You will require reshape2 as well as data.table

if(!require("data.table")){install.packages("data.table")}
if(!require("reshape2")){install.packages("reshape2")}

require("data.table")
require("reshape2")


# Download Zip file of the Data.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","final.zip",method = "curl")

# Unzip the Zip File.
unzip("final.zip")

# Get the list of feature names.
features <- read.table("./UCI HAR Dataset/features.txt")

# Get all the activity labels.
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Get the Training Features Data and Labels Data.
TrainFeatures <- read.table("./UCI HAR Dataset/train/x_train.txt")
TrainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Get the Testing Features Data and Labels Data.
TestFeatures <- read.table("./UCI HAR Dataset/test/x_test.txt")
TestLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Get the Training and Testing Subjects.
TrainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
TestSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge Training and Testing Features, Assign Feature Names and then Select Required Columns.
FinalFeatures <- rbind(TrainFeatures,TestFeatures)
names(FinalFeatures) <- as.vector(features$V2)
selectedFeatures <- grep("std\\(\\)|mean\\(\\)",as.vector(features$V2))
FinalFeatures <- FinalFeatures[,selectedFeatures]

# Merge Training and Testing Activity Labels.
FinalLabels <- rbind(TrainLabels,TestLabels)
names(FinalLabels) <- c("Activity")

# Merge Training and Testing Subjects.
FinalSubjects <- rbind(TrainSubjects,TestSubjects)
names(FinalSubjects) <- c("Subject")

# Merge all 3 Final Column Sets together.
FinalTable <- cbind(FinalSubjects,FinalLabels,FinalFeatures)

# Assign activity names to all the labels in the Final Table.
assignActivity <- function(x){activity[activity$V1 == x,]$V2}
FinalTable$Activity <- sapply(FinalTable$Activity,assignActivity)

# Collapse the FinalTable into a New Table where the mean of the features is taken
# For every combination of Activity and Subjects.
NewData <- aggregate(. ~ Subject + Activity,data = FinalTable,mean)
NewData <- NewData[order(NewData$Subject,NewData$Activity),]

# Write the Data to a file.
write.table(NewData,file = "TidyData.txt",row.names = FALSE)
