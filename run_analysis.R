# libraries
library(dplyr) 

# Merge the training and test datasets

# Read training data 
x_train       <- read.table("./train/X_train.txt")
y_train       <- read.table("./train/Y_train.txt") 
subject_train <- read.table("./train/subject_train.txt")

# Read test data 
x_test       <- read.table("./test/X_test.txt")
y_test       <- read.table("./test/Y_test.txt") 
subject_test <- read.table("./test/subject_test.txt")

# Read features
features <- read.table("./features.txt") 

# Read activity labels 
activity_labels <- read.table("./activity_labels.txt") 

# Merge training and test datasets
x_total   <- rbind(x_train, x_test)
y_total   <- rbind(y_train, y_test) 
sub_total <- rbind(subject_train, subject_test) 

# Extract only measurements for mean and standard deviation 
sel_features <- features[grep(".*mean\\(\\)|std\\(\\)", features[,2], ignore.case = FALSE),]
x_total      <- x_total[,sel_features[,1]]

# Assign variable names
colnames(x_total)   <- sel_features[,2]
colnames(y_total)   <- "activity"
colnames(sub_total) <- "subject"

# Merge final dataset
total <- cbind(sub_total, y_total, x_total)

# Factorize activities and subjects
total$activity <- factor(total$activity, levels = activity_labels[,1], labels = activity_labels[,2]) 
total$subject  <- as.factor(total$subject) 

# Create a second,  independent tidy dataset from final dataset 
# with the average of each variable for each activity and each subject. 
total_mean <- total %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

# Write summary dataset
write.table(total_mean, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE) 

