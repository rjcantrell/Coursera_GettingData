DATA DICTIONARY - HAR Summary

Process
-------
Acquire source dataset (http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Combine TEST_X, TEST_Y, and TEST_SUBJECT into a single table
Combine TRAIN_X, TRAIN_Y, and TRAIN_SUBJECT into a single table
Append the TEST table to the TRAIN table to form a single table
Since "sum(!complete.cases(TESTTRAIN))" returns zero, no modification was made to the source data.
Gather a list of all features containing the text "mean" or "std" (per the assignment)
Strip out all non-identity columns not containing "mean" or "std"
Melt the dataset (by subject ID and activity)
Recast the dataset as the averages of each non-identity column in the molten dataset.

See "features_info.txt" in the archive for more information on the individual measures summarized below.

Name								Type		Remarks
----							  	----		-------
subject_ID                        	numeric		1 - 20, each representing a distinct individual in the study.
bodyPosition_Desc                 	character	As per "activity_labels.txt" in the HAR dataset:
												WALKING
												WALKING_UPSTAIRS
												WALKING_DOWNSTAIRS
												SITTING
												STANDING
												LAYING
Avg_tBodyAcc_mean_X					numeric		
Avg_tBodyAcc_mean_Y					numeric               
Avg_tBodyAcc_mean_Z					numeric               
Avg_tGravityAcc_mean_X				numeric
Avg_tGravityAcc_mean_Y            	numeric
Avg_tGravityAcc_mean_Z            	numeric
Avg_tBodyAccJerk_mean_X          	numeric
Avg_tBodyAccJerk_mean_Y           	numeric
Avg_tBodyAccJerk_mean_Z           	numeric
Avg_tBodyGyro_mean_X             	numeric
Avg_tBodyGyro_mean_Y              	numeric
Avg_tBodyGyro_mean_Z              	numeric
Avg_tBodyGyroJerk_mean_X         	numeric
Avg_tBodyGyroJerk_mean_Y          	numeric
Avg_tBodyGyroJerk_mean_Z          	numeric
Avg_tBodyAccMag_mean             	numeric
Avg_tGravityAccMag_mean           	numeric
Avg_tBodyAccJerkMag_mean          	numeric
Avg_tBodyGyroMag_mean            	numeric
Avg_tBodyGyroJerkMag_mean        	numeric
Avg_fBodyAcc_mean_X               	numeric
Avg_fBodyAcc_mean_Y              	numeric
Avg_fBodyAcc_mean_Z               	numeric
Avg_fBodyAcc_meanFreq_X           	numeric
Avg_fBodyAcc_meanFreq_Y          	numeric
Avg_fBodyAcc_meanFreq_Z           	numeric
Avg_fBodyAccJerk_mean_X           	numeric
Avg_fBodyAccJerk_mean_Y          	numeric
Avg_fBodyAccJerk_mean_Z           	numeric
Avg_fBodyAccJerk_meanFreq_X       	numeric
Avg_fBodyAccJerk_meanFreq_Y      	numeric
Avg_fBodyAccJerk_meanFreq_Z       	numeric
Avg_fBodyGyro_mean_X              	numeric
Avg_fBodyGyro_mean_Y             	numeric
Avg_fBodyGyro_mean_Z              	numeric
Avg_fBodyGyro_meanFreq_X          	numeric
Avg_fBodyGyro_meanFreq_Y         	numeric
Avg_fBodyGyro_meanFreq_Z          	numeric
Avg_fBodyAccMag_mean              	numeric
Avg_fBodyAccMag_meanFreq         	numeric
Avg_fBodyBodyAccJerkMag_mean     	numeric
Avg_fBodyBodyAccJerkMag_meanFreq  	numeric
Avg_fBodyBodyGyroMag_mean        	numeric
Avg_fBodyBodyGyroMag_meanFreq     	numeric
Avg_fBodyBodyGyroJerkMag_mean     	numeric
Avg_fBodyBodyGyroJerkMag_meanFreq	numeric
Avg_tBodyAcc_std_X                	numeric
Avg_tBodyAcc_std_Y                	numeric
Avg_tBodyAcc_std_Z               	numeric
Avg_tGravityAcc_std_X             	numeric
Avg_tGravityAcc_std_Y             	numeric
Avg_tGravityAcc_std_Z            	numeric
Avg_tBodyAccJerk_std_X            	numeric
Avg_tBodyAccJerk_std_Y            	numeric
Avg_tBodyAccJerk_std_Z           	numeric
Avg_tBodyGyro_std_X               	numeric
Avg_tBodyGyro_std_Y               	numeric
Avg_tBodyGyro_std_Z              	numeric
Avg_tBodyGyroJerk_std_X           	numeric
Avg_tBodyGyroJerk_std_Y           	numeric
Avg_tBodyGyroJerk_std_Z          	numeric
Avg_tBodyAccMag_std               	numeric
Avg_tGravityAccMag_std            	numeric
Avg_tBodyAccJerkMag_std          	numeric
Avg_tBodyGyroMag_std              	numeric
Avg_tBodyGyroJerkMag_std          	numeric
Avg_fBodyAcc_std_X               	numeric
Avg_fBodyAcc_std_Y                	numeric
Avg_fBodyAcc_std_Z                	numeric
Avg_fBodyAccJerk_std_X           	numeric
Avg_fBodyAccJerk_std_Y            	numeric
Avg_fBodyAccJerk_std_Z            	numeric
Avg_fBodyGyro_std_X              	numeric
Avg_fBodyGyro_std_Y               	numeric
Avg_fBodyGyro_std_Z               	numeric
Avg_fBodyAccMag_std              	numeric
Avg_fBodyBodyAccJerkMag_std       	numeric
Avg_fBodyBodyGyroMag_std          	numeric
Avg_fBodyBodyGyroJerkMag_std  		numeric