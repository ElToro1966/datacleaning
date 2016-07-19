Code Book
=========

The Variables
-------------
The data is a result of measurements of the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). In addition, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals) [1]

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
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

The set of variables estimated from these signals and used here: 
mean(): Mean value
std(): Standard deviation

The Data
--------
The data comes from thw two data tables in [1], x_train.txt and x_test.txt, which are merged into one data frame. The data is 

Transformations and Work Performed To Clean Up The Data
-------------------------------------------------------

1.Merging of the training and the test sets to create one data set:
- features.txt contains all variable names of the original data set and is thus used to create and name coloumns in the new data sets.
- x_train.txt and x_test.txt contains all the data in the training and test sets respectively, and are used to crete rows in the new data sets.
- After creating two data sets, traindf and testdf, we merge these data sets into one large data set; completedf.

2.Extraction of only the measurements on the mean and standard deviation for each measurement: We are supposed to get the only the measurements on the mean and standard deviation for each measurement. From features.txt we can see that alle these variable names contain either "std()" or "mean()" (the very last variables, angle..., have "mean" only, but these variables are not to be included as all angle...-variables are only derivations of measurements). Thus, we can choose columns with the help of regular expression.

3.Uses descriptive activity names to name the activities in the data set appropriately labels the data set with descriptive variable names:

4.Creation of an independent tidy data set with the average of each variable for each activity and each subject:

Reference
---------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012