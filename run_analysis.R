# Getting necessary libraries
library(dplyr)

# Merging the training and the test sets to create one data set
colnamesdf <- read.table("UCI HAR Dataset/features.txt",
                         encoding="UTF-8")
colnamesv <- colnamesdf$V2
activitylabelsdf <- read.table("UCI HAR Dataset/activity_labels.txt", 
                               col.names = c("no", "activity"),
                               encoding="UTF-8")

traindf <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = colnamesv,
                      encoding="UTF-8")
traindf[,"subject"] <- read.table("UCI HAR Dataset/train/subject_train.txt",
                                  encoding="UTF-8")
trainlabelsdf <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("no"),
                            encoding="UTF-8")
traindf[,"activity"] <- merge(activitylabelsdf,trainlabelsdf)$activity
traindf[,"originaldataset"] <- "train"

testdf <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = colnamesv,
                     encoding="UTF-8")
testdf[,"subject"] <- read.table("UCI HAR Dataset/test/subject_test.txt",
                                 encoding="UTF-8")
testlabelsdf <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("no"),
                           encoding="UTF-8")
testdf[,"activity"] <- merge(activitylabelsdf,testlabelsdf)$activity
testdf[,"originaldataset"] <- "test"

completedf <- rbind(traindf,testdf)

rm(traindf); rm(trainlabelsdf); rm(testdf); rm(testlabelsdf)

# Extract only the measurements on the mean and standard deviation for each measurement,
# interpreted as being columns with std() or mean() in the variable name (in addition
# we need the columns we added above; subject, activity and originaldataset)
colselection <- grep('mean[:punct:]|std[:punct:]|subject|activity|originaldataset',
                     colnames(completedf))
selectdf <- completedf[,colselection]
#rm(completedf)

#From the data set, selecteddf, we create a second, independent tidy data set, 
# byactivitysubject, with the average of each variable for each 
# activity and each subject (column 1 is activity, column 2 subject)
byactivitysubject <- aggregate(selectdf, 
                               by = list(selectdf$activity,selectdf$subject), 
                               mean)
byactivitysubject <- subset(byactivitysubject, 
                            select=-c(activity,subject,originaldataset))
names(byactivitysubject)[1] <- "activity"
names(byactivitysubject)[2] <- "subject"
rm(selectdf)

# Saving the data set to txt-file
write.table(byactivitysubject, file = "cleandataset.txt", row.names = FALSE)