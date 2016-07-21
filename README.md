# datacleaning

Read Me
=======

Introduction
------------
This repo explains how all of the scripts work and how they are connected. The data has been gathered from [1]. The resulting dataset - saved to cleandataset.txt - is clean because it complies with the requirements set out in [2].

The run_analysis-Script
-----------------------

### Getting the dplyr library

The dplyr library is used for manipulating the data frames in the project.

### Merging the training and the test sets to create one data set

First, we read the names of all the existing columns and the labels of all activities. Second, we get the train-data and add subject, activity and originaldataset (for traceability). Subsequently, we do the same for the test-data. Finally, we merge the train and test-data (rbind).

### Extracting the measurements on the mean and standard deviation

According to the assignment, we are supposed to produce a script that "Extracts only the measurements on the mean and standard deviation for each measurement." This is open to interpretation, as it might mean all measurements with "mean" in the label, as well as the calculated variables with "mean()" and "std()" in the label. I interpret the assignment such that we are only supposed to include the latter.

We extract the required columns by finding column names containing
* mean()
* std()

We also want to include the variables we added when getting the activities and subjects, as well as a column showing where the data originated from (for traceability):
* subject
* activity
* originaldataset

###Create a second, independent tidy data set

We create a second, independet tidy dataset by aggregating on activity and subject. The data set is further cleaned by removing columns containing superfluous information or only NAs (activity, subject and originaldataset). 

This dataset is thus grouped by activity and subject. It is tidy according to [2]:&nbsp;
1.  Each variable forms a column.
2.  Each observation forms a row.
3.  Each type of observational unit forms a table.

###Saving the Data

The data is saved as a data table in a text-file.

License of Original Dataset
---------------------------
The original datase used [1] is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited. Authors: Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Reference
---------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).
Vitoria-Gasteiz, Spain. Dec 2012.

[2] Tidy Data, by Hadley Wickham. Journal of Statistical Software, August 2014. Downloaded July 18, 2016. https://www.jstatsoft.org/article/view/v059i10/v59i10.pdf