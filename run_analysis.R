## Download raw data
if (!file.exists("UCI HAR Dataset")) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  destfile <- "UCI-HAR-Dataset.zip"
  download.file(url, destfile, method = "curl")
  unzip(paste(getwd(), destfile, sep="/"))
}

# Load activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                              col.names = c("label", "activity"))

# Load features
features <- read.table("./UCI HAR Dataset/features.txt")[, 2]

# Load and process test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                           col.names = c("subject"))
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(X_test) = features
X_test <- X_test[, grepl("mean|std", features)]
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                     col.names = c("label"))
y_test$activity = activity_labels$activity[y_test[, 1]]
test_data <- cbind(subject_test, y_test, X_test)
test_data <- test_data[-2]

# Load and process train data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            col.names = c("subject"))
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train) = features
X_train <- X_train[, grepl("mean|std", features)]
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                      col.names = c("label"))
y_train$activity = activity_labels$activity[y_train[, 1]]
train_data <- cbind(subject_train, y_train, X_train)
train_data <- train_data[-2]

# Merge test and train data
data <- rbind(test_data, train_data)

## Create the tidy data set with the average of each variable for each activity
## and each subject
tidy <- aggregate(data, by = list(subject = data$subject, 
                                  activity = data$activity), mean)
tidy <- tidy[c(-3,-4)]
write.table(tidy, file = "tidy.txt", quote = FALSE, row.names = FALSE, 
            sep = "\t")


write.table(paste("* ", names(tidy), sep = ""), file = "CodeBook.md", 
            quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")

