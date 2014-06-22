Getting and Cleaning Data: Course Project
=========================================

Purpose 
-------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1. A tidy data set as described below;
2. A link to a Github repository with your script for performing the analysis; and 
3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a 'README.md' in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.


Objectives
----------

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis.R
-----------------
1. Loads the dataset from UCI-HAR-Dataset.zip file and unzips it. It will download the zip file if necessary;
2. Loads the activity label (activity_labels.txt);
3. Loads the features (features.txt);
4. Loads the test dataset (X_test.txt, y_test.txt and subject_test.txt)
5. Process the test dataset and extracts only the measurements on the mean and standard deviation for each measurement;
6. Uses descriptive activity names to name the activities in the test dataset;
7. Labels the dataset with descriptive activity names in the test dataset;
8. Merges the X_test y_test and subject_test are merged with cbind;
9. Cleans the label column from test dataset;
10. Loads the train dataset (X_train.txt, y_train.txt and subject_train.txt)
11. Process the train dataset and extracts only the measurements on the mean and standard deviation for each measurement;
12. Uses descriptive activity names to name the activities in the train dataset;
13. Labels the dataset with descriptive activity names in the train dataset;
14. Merges the X_train y_train and subject_train are merged with cbind;
15. Cleans the label column from train dataset;
16. Merges the train and the test datasets to create one dataset with rbind;
17. Creates a second, independent tidy dataset with the average of each variable for each activity and each subject.
18. Exports the tidy dataset to exported to tidy.txt with write.table() function.

