## This code was built to answer Coursera Getdata-013 programming assignment
## It assumes that the code is run from the working directory

## Setting up the library
        library(dplyr)
  
## Reads the files in data frames that can be used by dplyr
        Number_rows <- 20000  # for testing purposes only, can be set to a small number
  
        X_train <- tbl_df(read.table("train/X_train.txt", nrow=Number_rows))
        Y_train <- tbl_df(read.table("train/Y_train.txt", nrow=Number_rows))
        S_train <- tbl_df(read.table("train/Subject_train.txt", nrow=Number_rows))

        X_test <- tbl_df(read.table("test/X_test.txt", nrow=Number_rows))
        Y_test <- tbl_df(read.table("test/Y_test.txt", nrow=Number_rows))
        S_test <- tbl_df(read.table("test/Subject_test.txt", nrow=Number_rows))
  
        features <- tbl_df(read.table("features.txt"))
        features <- select(features,V2)
        features <- t(features)
              
        labels <- tbl_df(read.table("activity_labels.txt"))
  
  
## Create a single dataset with "train" and "test" data
  
        ## Changes the names of the variables for S_ & Y_, so that there is no duplicate
        ## variable names
        S_train <- rename(S_train,subject=V1)
        Y_train <- rename(Y_train,Y1=V1)
        S_test <- rename(S_test,subject=V1)
        Y_test <- rename(Y_test,Y1=V1)
        
        ## Adds the columns names to the X_ files, as provided in the features.txt dataset 
        names(X_test) <- features
        names(X_train) <- features
        
        ## Bind rows of the test and train datasets
        Y <- rbind(Y_train,Y_test)
        X <- rbind(X_train,X_test)
        S <- rbind(S_train,S_test)
        
        
        ## Binds the columns of the resulting 3 dataset 
        DF_complete <- cbind(S,Y,X)
        
        ## Add labels from activities to the merged file, using a left join
        labels <- rename(labels,activity_label=V2)
        DF_complete <- left_join(DF_complete,labels,by = c("Y1" = "V1"), copy = FALSE)

## Extracts only the measurements on the mean and 
## standard deviation for each measurement
## [JFR] I read this as keeping all the non-measurement variables + measurement 
## variables that provides mean and std

        ## First we need to remove invalid characters in column names
        valid_column_names <- make.names(names=names(DF_complete), unique=TRUE, allow_ = TRUE)
        names(DF_complete) <- valid_column_names
        
        ## Second we keep only the 86 measurement columns + subject + activity columns
        DF_mean_std <- select(DF_complete, matches("subject"),matches("activity_label"),contains("mean"),contains("std"))
  
        ## Finally, we remonve the columns with the word "mean" that are not avg of source measures
        ## for example "meanFreq" and the additional vectors calculated on the derived angle variable
        DF_mean_std <- select(DF_mean_std, -contains("meanFreq"))
        DF_mean_std <- select(DF_mean_std, -contains("angle"))
        
        
## Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject
        DF_mean_std <- group_by(DF_mean_std,subject,activity_label)
        DF_summarized <- summarise_each(DF_mean_std, funs(mean))
        
        write.table(DF_summarized,"Mean_by_subject_and_activity.txt", row.names=FALSE)