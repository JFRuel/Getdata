==================================================================
Getting and Cleaning Data - Coursera "getdata-013"
Course Project  - April 2015
==================================================================
JFRuel on GitHub
==================================================================

This document explains how all the R script works and how it is connected to the input and output files.  

To be able to run the R file, you will need to download the source datasets using the following URL:
"Human Activity Recognition Using Smartphones Data Set".
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## The folder should include the following files:
=================================================

- 'README.MD' : Description of steps and setup required for running the R code
- 'CodeBook.MD' : Description of the input data, the transformations, and output data
- 'run_analysis.R' : R code used to create the output dataset
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Running the code
====================

The R code was built and tested using 
	- R version 3.1.3 (2015-03-09) -- "Smooth Sidewalk"
	- Platform: i386-w64-mingw32/i386 (32-bit)
	- dplyr package version 0.4.1

The "run_analysis.R" must be run from the working directory.

The "UCI HAR" (see above) must be extracted in the working directory.

The R code will use all of the above ".txt" files as input (including subfolders as describe above).

The output dataset will be created in the working directory, as "Mean_by_subject_and_activity.txt"

## License:
============

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
