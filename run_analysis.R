## Final project Getting and Cleaning Data: Nicolas Alejandro Heredia
library(dplyr)

## Getting the dataset
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

## Unzip the file, verifing if it's already exists
if(!file.exists("UCI HAR Dataset")) {unzip(zipfile="./data/Dataset.zip")}

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subjtest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subjtrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Merging data sets to create only one "AllData"
Xdat <- rbind(xtrain, xtest)
Ydat <- rbind(ytrain, ytest)
Subj <- rbind(subjtrain, subjtest)
AllData <- cbind(Subj, Ydat, Xdat)

## 2. Extracting means and std of each meassure 
Findata <- AllData %>% select(subject, code, contains("mean"), contains("std"))

## 3. Naming activities in data set with descriptive activity names
Findata$code <- activities[Findata$code, 2]

## 4. Properly labeling variable names in data set
names(Findata)[2] = "activity"
names(Findata)<-gsub("Acc", "Accelerometer", names(Findata))
names(Findata)<-gsub("Gyro", "Gyroscope", names(Findata))
names(Findata)<-gsub("BodyBody", "Body", names(Findata))
names(Findata)<-gsub("Mag", "Magnitude", names(Findata))
names(Findata)<-gsub("^t", "Time", names(Findata))
names(Findata)<-gsub("^f", "Frequency", names(Findata))
names(Findata)<-gsub("tBody", "TimeBody", names(Findata))
names(Findata)<-gsub("-mean()", "Mean", names(Findata), ignore.case = TRUE)
names(Findata)<-gsub("-std()", "STD", names(Findata), ignore.case = TRUE)
names(Findata)<-gsub("-freq()", "Frequency", names(Findata), ignore.case = TRUE)
names(Findata)<-gsub("angle", "Angle", names(Findata))
names(Findata)<-gsub("gravity", "Gravity", names(Findata))

## 5. From the data set in point 4, create an independent data set with the average of each variable for each activity and subject.
Findata2 <- Findata %>%
        group_by(subject, activity) %>%
        summarise_all(list(mean))
write.table(Findata2, "tidy_dataset.txt", row.name=FALSE)