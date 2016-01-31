##Code Book for UCI Data Set

###Data Set
===============
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

###Original Feature Selection
===============================
The features selected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

*mean(): Mean value
*std(): Standard deviation
*mad(): Median absolute deviation 
*max(): Largest value in array
*min(): Smallest value in array
*sma(): Signal magnitude area
*energy(): Energy measure. Sum of the squares divided by the number of values. 
*iqr(): Interquartile range 
*entropy(): Signal entropy
*arCoeff(): Autorregresion coefficients with Burg order equal to 4
*correlation(): correlation coefficient between two signals
*maxInds(): index of the frequency component with largest magnitude
*meanFreq(): Weighted average of the frequency components to obtain a mean frequency
*skewness(): skewness of the frequency domain signal 
*kurtosis(): kurtosis of the frequency domain signal 
*bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
*angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

*gravityMean
*tBodyAccMean
*tBodyAccJerkMean
*tBodyGyroMean
*tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

###New Feature Selection [Updated Jan. 2016]
=============================================
The features selected for this data set are the same as the features from the original data set. The variables are a subset of the original variables. The variables selected are the means and standard deviations.

The original variable names were only represented as numbers in the original data set, and the actual names were provided in the features.txt file. The variable names from the original data set have been modified  as follows:

  * prefixes "t" and "f" were replaced with "time" and "freq", respectively
  * variable names were placed in all lowercase letters
  * parentheses and hyphens were removed
  * original variable names for fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag had extra
    "body" in variable names; these were removed
  * "std" was changed to "sd"

The new variable names, used to replace the numbers in the original data set are as follows:

*timebodyacc[mean/sd][x/y/z]
*timegravityacc[mean/sd][x/y/z]
*timebodyaccjerk[mean/sd][x/y/z]
*timebodygyro[mean/sd][x/y/z]
*timebodygyrojerk[mean/sd][x/y/z]
*timebodyaccmag[mean/sd]
*timegravityaccmag[mean/sd]
*timebodyaccjerkmag[mean/sd]
*timebodygyromag[mean/sd]
*timebodygyrojerkmag[mean/sd]
*freqbodyacc[mean/sd][x/y/z]
*freqbodyaccjerk[mean/sd][x/y/z]
*freqbodygyro[mean/sd][x/y/z]
*freqbodyaccmag[mean/sd]
*freqbodyaccjerkmag[mean/sd]
*freqbodygyromag[mean/sd]
*freqbodygyrojerkmag[mean/sd]

The activities performed by the subjects were represented by numbers in the original data set. These numbers were replaced with the names of the actual labels (from the activity_labels.txt) data set. These labels were converted to lowercase letters and underscores were removed. 

The subjects of the study are represented by the same ID numbers as in the original data set.

Modified Data Set [Updated Jan. 2016]
=======================================
The subject ID (subject_test.txt) and the IDs for the activities performed by the participants (y_test.txt) were added to the test data set (X_test.txt). The same was done with (subject_train.txt) and (y_train.txt) for the training data set (X_train.txt).
These test and training data sets were combined into a single data set, in that order.  