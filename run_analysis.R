##downloads zipped data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,"dataset.zip")
unzip("dataset.zip")

##reads in files from directory where data is stored
test <- read.table("UCI HAR Dataset/test/X_test.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")
testactivity <- read.table("UCI HAR Dataset/test/y_test.txt")
trainactivity <- read.table("UCI HAR Dataset/train/y_train.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

##adds the label columns to test and train data sets
testdata <- cbind(testsubject, testactivity, test)
traindata <- cbind(trainsubject, trainactivity, train)

##merges test and train data sets
data <- rbind(testdata, traindata)

##identifies columns with means and standard deviations and creates a data set with these columns (as
##well as the subject and activity columns
cols <- grep("mean\\()|std\\()", features$V2)                       
measurements <- data[,c(1,2, (2+cols))]

##adds descriptive activity names to data set
activity <- activitylabels[measurements$V1.1,2]
measurements[,2] <- tolower(activity)                               #changes to all lower case letters
measurements[,2] <- gsub("\\_", "", measurements[,2])               #removes underscores

##cleans variable names
measurementlabels <- features[cols,2]
measurementlabels <- tolower(measurementlabels)                     #changes to all lower case
measurementlabels <- gsub("\\-", "", measurementlabels)             #replaces dashes with periods
measurementlabels <- gsub("\\()", "", measurementlabels)            #removes parentheses
measurementlabels <- gsub("std", "sd", measurementlabels)           #replaces "std" with "sd"
measurementlabels <- gsub("^t", "time", measurementlabels)          #replaces "t" with "time"
measurementlabels <- gsub("^f", "freq", measurementlabels)          #replaces "f" with "frequency"
measurementlabels <- gsub("bodybody", "body", measurementlabels)    #removes duplicate "body" in variable names

##adds descriptive variable name labels to data set
labels <-c("subject", "activity", measurementlabels)
colnames(measurements) <- labels

##data set with labelled columns
measurements

##creates data set with average of each variable for each activity and each subject
library(dplyr)
datasummary <- measurements %>%
    group_by(subject, activity) %>%
    summarize_each(funs(mean))

##summary data set
datasummary