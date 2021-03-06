# Getting-and-cleaning-data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The follows steps must be necessary to convert the raw into Tidy Data:

* Download the dataset from web if it does not already exist in the working directory.
* Read both the train and test datasets and merge them into x(measurements), y(activity) and subject, respectively.
* Load the data(x's) feature, activity info and extract columns named 'mean'(-mean) and 'standard'(-std). Also, modify column names to descriptive. (-mean to Mean, -std to Std, and remove symbols like -, (, ))
* Extract data by selected columns(from step 3), and merge x, y(activity) and subject data. Also, replace y(activity) column to it's name by refering activity label (loaded step 3).
* Generate 'Tidy Dataset' that consists of the average (mean) of each variable for each subject and each activity. The result is shown in the file tidy_dataset.txt.


This repository contains the following files:

   - README.md, this file, which provides an overview of the data set and how it was created.
   - tidy_dataset.txt, which contains the data set.
   - CODEBOOK.md, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).
   - run_analysis.R, the R script that was used to create the data set.

