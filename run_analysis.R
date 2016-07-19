# Getting necessary libraries
library(dplyr)

# Merging the training and the test sets to create one data set
colnamesdf <- read.table("UCI HAR Dataset/features.txt")
colnamesv <- colnamesdf$V2
activitylabelsdf <- read.table("UCI HAR Dataset/activity_labels.txt", 
                               col.names = c("no", "activity"))

traindf <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = colnamesv)
traindf[,"subject"] <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainlabelsdf <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("no"))
traindf[,"activity"] <- merge(activitylabelsdf,trainlabelsdf)$activity
traindf[,"originaldataset"] <- "train"

testdf <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = colnamesv)
testdf[,"subject"] <- read.table("UCI HAR Dataset/test/subject_test.txt")
testlabelsdf <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("no"))
testdf[,"activity"] <- merge(activitylabelsdf,testlabelsdf)$activity
testdf[,"originaldataset"] <- "test"

completedf <- rbind(traindf,testdf)

rm(traindf); rm(trainlabelsdf); rm(testdf); rm(testlabelsdf)

# Extract only the measurements on the mean and standard deviation for each measurement,
# interpreted as being columns with std() or mean() in the variable name (in addition
# we need the columns we added above; subject, activity and originaldataset)
colselection <- grep("mean()|std()|subject|activity|originaldataset",names(completedf))
selectdf <- completedf[,colselection]

rm(completedf)

#From the data set, selecteddf, we create a second, independent tidy data set, 
# byactivitysubject, with the average of each variable for each 
# activity and each subject (Group 1 is activity, Group 2 subject)
byactivitysubject <- aggregate(selectdf, 
                               by = list(selectdf$activity,selectdf$subject), 
                               mean)
rm(selectdf)