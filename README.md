##README

The run_analysis.R script downloads and cleans the testing and training data sets in the UCI HAR Dataset. 
*The subject and activity IDs are added to each of the testing and training data sets.
*The testing and training data sets are then merged into a single data set.
*The means and standard deviations for each measurement are extracted into a subsetted data set.
*The activity IDs are replaced by descriptive activity names.
*The variable names are then renamed with descriptive variable names. 
*A second, independent tidy data set is then created from the previously created data set, containing the
average of each variable for each activity and each subject.