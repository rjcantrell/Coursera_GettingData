#VARIABLES
WORKING_DIR  <- "D:/Dropbox/Classes/GettingData/Project";
PROJECT_URL     <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
PROJECT_ARCHIVE <- "archive.zip"
PROJECT_OUTPUT <- "Summarized_HAR_Data.txt"

CONST_SUBJECTID <- "subject_ID"
CONST_BODYPOSITIONID <- "bodyPosition_ID"
CONST_BODYPOSITIONDSESC <- "bodyPosition_Desc"

#Set the proper working folder if you're not already there
#TODO: submission probably does not want this
if (!grepl(paste0("^.+", WORKING_DIR, "$"),getwd())) {
  setwd(WORKING_DIR)
}

#Download the archive to the working directory
if (!file.exists(PROJECT_ARCHIVE)) {
  download.file(url = PROJECT_URL, destfile = PROJECT_ARCHIVE)
}

# ASSUMPTION!!! From looking at this zip before, I know all its files to be in a subfolder.
# We should get the name of the subfolder for future file loading:
# unzip(..., list=TRUE) returns a list of files in the archive, so grab the "Name" of the first row.
# then, split that path on the path-separator and take the first result to get the top subdirectory.
DATA_SUBFOLDER <- strsplit(unzip(PROJECT_ARCHIVE, list = TRUE)$Name[1],"/")[[1]][1]
if (!file.exists(DATA_SUBFOLDER))
{
  unzip(PROJECT_ARCHIVE)
}

#"Merges the training and the test sets to create one data set."
#  X_test.txt           -- 561 datapoints x 2948 observations
#  features.txt         -- 2 datapoints x 561 observations; (column number, column name of datapoints in X_test)
#  Y_test.txt           -- 1 datapoint x 2948 observations; (number representing body position)
#  activity_labels.txt  -- 2 datapoints x 6 observations; (data value from Y_test, descriptive text)
setwd(DATA_SUBFOLDER)
FEATURE_NAMES <- read.table("features.txt", col.names = c("order", "featureName"), check.names = TRUE)
POSITIONS <- read.table("activity_labels.txt", col.names = c(CONST_BODYPOSITIONID, CONST_BODYPOSITIONDSESC))

# Read the test data
TEST_X <- read.table("test/X_test.txt", col.names = FEATURE_NAMES$featureName, check.names = TRUE)
TEST_Y <- read.table("test/Y_test.txt", col.names = c(CONST_BODYPOSITIONID))
TEST_Y <- merge(TEST_Y, POSITIONS)
TEST_SUBJECT <- read.table("test/subject_test.txt", col.names = c(CONST_SUBJECTID))

#TODO: Remove this before submission!
#TEST_X <- head(TEST_X)
#TEST_Y <- head(TEST_Y)
#TEST_SUBJECT <- head(TEST_SUBJECT)
#TODO: Remove this before submission!

# Read the training data -- in a perfect world, this would use dynamic var names or a function
TRAIN_X <- read.table("train/X_train.txt", col.names = FEATURE_NAMES$featureName, check.names = TRUE)
TRAIN_Y <- read.table("train/Y_train.txt", col.names = c(CONST_BODYPOSITIONID))
TRAIN_Y <- merge(TRAIN_Y, POSITIONS)
TRAIN_SUBJECT <- read.table("train/subject_train.txt", col.names = c(CONST_SUBJECTID))

#TODO: Remove this before submission!
#TRAIN_X <- head(TRAIN_X)
#TRAIN_Y <- head(TRAIN_Y)
#TRAIN_SUBJECT <- head(TRAIN_SUBJECT)
#TODO: Remove this before submission!

TESTTRAIN <- rbind(cbind(TEST_X, TEST_Y, TEST_SUBJECT), 
                   cbind(TRAIN_X, TRAIN_Y, TRAIN_SUBJECT))

#"Extracts only the measurements on the mean and standard deviation for each measurement. "
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. "
# From feature_info.txt: "The set of variables that were estimated from these signals are: 
#  mean(): Mean value
#  std(): Standard deviation"

AVGS_STDS <- c(grep("mean",FEATURE_NAMES$featureName, value = TRUE),
               grep("std",FEATURE_NAMES$featureName, value = TRUE))
COLNAMES <- make.names(c(CONST_SUBJECTID, CONST_BODYPOSITIONDSESC, AVGS_STDS))
TESTTRAIN <- subset(TESTTRAIN, select=COLNAMES) #or TESTTRAIN[,c(COLNAMES)]

#"Creates a second, independent tidy data set with the average of each variable for each activity and each subject."
#TODO: create tidy data set
molten <- melt(TESTTRAIN, id.vars = c(CONST_SUBJECTID, CONST_BODYPOSITIONDSESC))

# yeah, yeah, I know I'm breaking my convention of using a var to hold the field names. 
# as.quoted(VARNAME) does exactly what I seek when used alone but not in context of dcast.
FINAL_ANSWER <- dcast(molten, subject_ID + bodyPosition_Desc ~ variable, mean)
FRIENDLY_NAMES <- gsub("\\.+", "_", names(FINAL_ANSWER))    #replace one-to-many periods with underscore
FRIENDLY_NAMES <- gsub("_$", "", FRIENDLY_NAMES)            #replace any trailing underscores

#notify user everything but Subj ID and position are averages
FRIENDLY_NAMES[3:length(FRIENDLY_NAMES)] <- paste0("Avg_", FRIENDLY_NAMES[3:length(FRIENDLY_NAMES)]) 

names(FINAL_ANSWER) <- FRIENDLY_NAMES
write.table(FINAL_ANSWER, file = PROJECT_OUTPUT)