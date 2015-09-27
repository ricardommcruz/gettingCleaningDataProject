# Use the data.table package for fast processing
library(data.table)

# 1. Read the list of features (variables) and select only
# those representing means and standard deviations
features <- fread('data/features.txt', sep=' ')
features <- features[grepl('mean()', features$V2) | grepl('std()', features$V2),]

# 2. Read the test data and apply the following operations in order
# - Drop all columns that we are not interested in
# - Assign column names (we will tweak these later)
# - Read the activity codes
# - Read the subject codes
# - Add the activity and subject codes to the rest of the data.table
# - Rename the activity code column
# - Rename the subject code column

test           <- fread('data/test/X_test.txt')
test           <- test[,features$V1, with=FALSE]
names(test)    <- features$V2
activities     <- fread('data/test/y_test.txt')
subjects       <- fread('data/test/subject_test.txt')
test           <- cbind(activities, subjects, test)
names(test)[1] <- "Activity"
names(test)[2] <- "Subject"

# 3. Read the train data and apply the following operations in order
# - Drop all columns that we are not interested in
# - Assign column names (we will tweak these later)
# - Read the activity codes
# - Read the subject codes
# - Add the activity and subject codes to the rest of the data.table
# - Rename the activity code column
# - Rename the subject code column

train           <- fread('data/train/X_train.txt')
train           <- train[,features$V1, with=FALSE]
names(train)    <- features$V2
activities      <- fread('data/train/y_train.txt')
subjects        <- fread('data/train/subject_train.txt')
train           <- cbind(activities, subjects, train)
names(train)[1] <- "Activity"
names(train)[2] <- "Subject"

# 4. Merge the two data sets
data <- rbindlist(list(test,train))

# 5. Read the activity labels
activities <- fread('data/activity_labels.txt')

# 6. Link activity codes with activity labels
# - perform the join
# - drop the activity code column (no longer needed)
# - rename the activity label column
data <- merge(activities, data , by.x = c('V1'), by.y = c('Activity'))
data <- data[,V1:=NULL]
names(data)[1] <- "Activity"

# 7. Remove all temporary objects from memory
rm(test)
rm(train)
rm(activities)
rm(subjects)
rm(features)

# 8. Create a separate data set with means for each variable
# grouped by Activity and Subject
averages <- data
averages <- averages[,lapply(.SD, mean, na.rm=TRUE),by=list(Activity,Subject)]
averages <- averages[order(averages$Activity, averages$Subject),]

tweakLabels <-function(colName) {
  colName <- sub('^t','',colName)
  colName <- sub('^f','',colName)
  colName
}

names(data)     <- sapply(names(data), tweakLabels )
names(averages) <- sapply(names(averages), tweakLabels )

# 9. Write the datasets to a file for later retrival and processing
write.table(data, "fuci_har_dataset.txt", sep=' ', row.name=FALSE, quote=FALSE)
write.table(averages, "fuci_har_dataset_summarised_means.txt", sep=' ', row.name=FALSE, quote=FALSE)

# 10. Remove datasets from memory
rm(averages)
rm(data)
