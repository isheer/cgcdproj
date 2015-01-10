##
## Coursera Getting and Cleaning Data Course Project run_analysis.R script
##
## This script downloads data set from UCI Machine Learning Repository and
## creates a tidy reduced data set containing summary information from some
## of the study variables.
##

# load required R packages
library(dplyr) # used in step 5.

# download and unzip dataset if required
datadir <- "UCI HAR Dataset"
if (! file.exists(datadir)) {
    zipFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(zipFileURL, destfile="Dataset.zip", method="curl")
    unzip("Dataset.zip")
}

# 1. Merges the training and the test sets to create one data set.
X_test <- read.table(paste(datadir, "test/X_test.txt", sep="/"))
X_train <- read.table(paste(datadir, "train/X_train.txt", sep="/"))
X1 <- rbind(X_test, X_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table(paste(datadir, "features.txt", sep="/"))
colnums <- grep("-(mean|std)\\(\\)", features$V2) # columns with "-mean()" or "-std()" in name
X2 <- X1[, colnums]

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(paste(datadir, "activity_labels.txt", sep="/"))
activities <- as.character(activity_labels$V2) # activity labels
# load activites as factors...
y_test <- read.table(paste(datadir, "test/y_test.txt", sep="/"), colClasses=c("factor"))
y_train <- read.table(paste(datadir, "train/y_train.txt", sep="/"), colClasses=c("factor"))
y <- rbind(y_test, y_train)
names(y) <- c("activity")
levels(y$activity) <- activities # activity labels as factor levels
X3 <- cbind(y, X2)

# 4. Appropriately labels the data set with descriptive variable names.
colnames <- c("activity")
colnames <- append(colnames, as.character(features$V2[colnums]))
# R does not like any of the following characters in column names: [-,()]
colnames <- gsub("-", ".", colnames)      # convert '-' to '.'
colnames <- gsub(",", "_", colnames)      # convert ',' to '_'
colnames <- gsub("\\(", ".", colnames)    # convert '(' to '.'
colnames <- gsub("\\)", ".", colnames)    # convert ')' to '.'
colnames <- gsub("\\.+", "\\.", colnames) # collapse multiple '.' to single '.'
colnames <- gsub("\\.$", "", colnames)    # remove trailing '.'
names(X3) <- colnames

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# first we need to add in subject data
subject_test <- read.table(paste(datadir, "test/subject_test.txt", sep="/"))
subject_train <- read.table(paste(datadir, "train/subject_train.txt", sep="/"))
subject <- rbind(subject_test, subject_train)
names(subject) <- c("subject")
X5 <- cbind(subject, X3)
# now we build our tidy data frame
# start with first variable to establish the structure
colnames <- names(X5) # overwrite vector from step 4 since we added "subject"
colname <- colnames[3]
m <- paste("mean(", colname, ")", sep="")
v <- X5 %>% group_by(activity, subject) %>% summarize_(m)
v <- cbind(v, rep(colname, dim(v)[1]))
names(v)[3:4] <- c("mean", "measure")
Xt <- v
# now add remaining variables to
for (i in 4:length(colnames)) {
    colname <- colnames[i]
    m <- paste("mean(", colname, ")", sep="")
    v <- X5 %>% group_by(activity, subject) %>% summarize_(m)
    v <- cbind(v, rep(colname, dim(v)[1]))
    names(v)[3:4] <- c("mean", "measure")
    Xt <- rbind(Xt, v)
}
# save tidy data set to file
write.table(Xt, "Xt.txt", quote=FALSE, row.names=FALSE)
