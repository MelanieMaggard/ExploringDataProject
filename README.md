---
title: "ReadMe"
author: "Melanie Maggard"
date: "Friday, March 20, 2015"
output: html_document
---
==================================================================
Getting & Cleaning Data Course Project
==================================================================
Melanie Maggard, PhD
melaniemaggard@gmail.com
==================================================================

This document describes the utility of the run_Analysis.R script, which should be placed in the same directory as the folder containing the data extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , which was originally taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

As noted in the README.txt included in the zip file, this data comes from experiemnts collecting 3-axial linear acceleration and 3-axial angular velocity data via Smartphones on the activities of 30 participants.  The activities for which each participant was measured include the following: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

The tidy data set created by the run_Analysis.R script includes the following:
======================================
- Subject number (1-30)
- Activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- Columns representing the various mesurements (e.g., tBodyAcc-mean()-X) taken
- Values in the columns represent the AVERAGE for that measurement, subject, and activity, collapsed across test and training data


The steps needed to produce the tidy dataset include the following:
======================================
- Download and extract zip file containing dataset from the link provided above.
- Download and save run_Analysis.R script in the same directory as the extracted zip file.
- Set working directory(wd) to the one containing both the extracted zip file and run_Analysis.R script.
- Run the run_Analysis.R script.
- The variable "avgData" contains the tidy data set, which is also available in text format via the "TidyData.txt" file that was created in the last line of the script.

A summary of the steps taken in the run_Analysis.R script to create the tiny dataset include the following:
======================================
- Creates a clean training data file by reading the training folder and creating a dataframe containing: 
  - subject number from subject_train.txt, 
	- the labels for the activities for which the measurement was taken from y_train.txt, 
	- only the data for the mean or standard deviation measurements from X_train.txt, 
	- and names the columns using the list of measurements from features.txt for each data value.
- Creates a clean test data file by reading the test folder and creating a dataframe containing: 
	- subject number from subject_test.txt, 
	- the labels for the activities for which the measurement was taken from y_test.txt, 
	- only the data for the mean or standard deviation measurements from X_test.txt, 
	- and names the columns using the list of measurements from features.txt for each data value.
- Combines the data from the clean training and clean test data files.
- Renames the activities by replacing the numbers with their factor names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- Creates a new tidy data set with the mean for all measurements for each subject and activity.


The zip file that should be extracted as noted above contains a dataset with the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
