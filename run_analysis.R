# Load dplyr & reshape2 libraries for creating and shaping dataframes.

library(dplyr)
library(reshape2)

# Create a new dataframe that will contain all merged data from train and test data.
allData <- data.frame()

# Read X training data file into R.
Xtrain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

# Read features file into a vector, and then set this as the descriptive names for the X train data file.
features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
colnames(Xtrain) <- features$V2

# Create new dataframe with only the mean and standard deviation columns from the X train data.
cleanXTrain <- Xtrain[ ,grep("mean\\(\\)|std", colnames(Xtrain))]

# Read and combine Y train and Subject train data.  Before combining, give single column 
# in each a more descriptive name as they are currently listed as same variable name (V1).
Ytrain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
names(Ytrain) <- c("Activity")
Strain <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
names(Strain) <- c("Subject")
trainData <- cbind(Strain, Ytrain)

# Combine Y train & Subject train data with clean X train data.
trainData <- cbind(trainData, cleanXTrain)

# Read X test data file into R.
Xtest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

# Read features file into vector, then set this as the descriptive names for the X test data file.
features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
colnames(Xtest) <- features$V2

# Create new dataframe with only the mean and standard deviation columns from the X test data.
cleanXTest <- Xtest[ ,grep("mean\\(\\)|std", colnames(Xtest))]

# Read and combine Y test and Subject test data. Before combining, give single column
# in each a more descriptive name as they are currently listed as same variable name (V1).
Ytest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
names(Ytest) <- c("Activity")
Stest <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
names(Stest) <- c("Subject")
testData <- cbind(Stest, Ytest)

# Combine Y test & Subject test data with clean X test data.
testData <- cbind(testData, cleanXTest)

# Combine train and test data into allData dataframe created earlier.
allData <- rbind(trainData, testData)

# Use factor names for activities in Activity variable, replacing numbers 1-6 with activites
# as follows: "WALKING"=1, "WALKING_UPSTAIRS"=2, "WALKING_DOWNSTAIRS"=3, "SITTING"=4, "STANDING"=5, "LAYING"=6
allData$Activity <- factor(allData$Activity, levels = c(1:6))
levels(allData$Activity) <- list("WALKING"=1, "WALKING_UPSTAIRS"=2, "WALKING_DOWNSTAIRS"=3, "SITTING"=4, "STANDING"=5, "LAYING"=6)

# Create new dataframe for averages.
avgData <- data.frame()

# Cast the averages into dataframe created above (avgData). This creates a dataframe that has the average mean or
# standard deviation for each measurement, activity, and subject.
avgData <- melt(allData, id.vars = c("Subject", "Activity"), variable.name = "Measurement_Type", value.name = "Average")
avgData <- cast(avgData, Subject + Activity ~ variable, mean)

# Create text file containing tidy data set.
write.table(avgData,file="./TidyData.txt", sep= " ", row.name=FALSE, col.names=TRUE) 





