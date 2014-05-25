##  run_analysis.R
##  Script that merges training and test data sets to create a tidy, consolidated data set.

# Install reshape2 package.
# install.packages("reshape2"); library("reshape2")

# Merge training, test, and corresponding subject information into individual files.
tmp_train_X <- read.table('X_train.txt')
tmp_test_X <- read.table('X_test.txt')
X <- rbind(tmp_train_X, tmp_test_X)
# 
tmp_train_Y <- read.table('Y_train.txt')
tmp_test_Y <- read.table('Y_test.txt')
Y <- rbind(tmp_train_Y, tmp_test_Y)
# 
subject_train <- read.table('subject_train.txt')
subject_test <- read.table('subject_test.txt')
subjects <- rbind(subject_train, subject_test)

# Read features in features.txt file
features <- read.table('features.txt')

# Extract mean and std. dev. variables from feature list
indexed_features <- grep('-mean\\(\\)|-std\\(\\)', features)
X <- X[,indexed_features]
names(X) <- features[indexed_features,2]
names(X) <- gsub('\\(\\)','',names(X))

# Create descriptive activity names to name activities

A <- read.table('activity_labels.txt')
A[,2] <- gsub('_', '', tolower(as.character(A[,2])))
Y[,1] = A[Y[,1],2]
names(Y) <- "Activity"

names(subjects) <- "Subject"
clean <- cbind(subjects,Y,X)
write.table(clean, "Clean_mean_std_data.txt")

unique_S <- unique(subjects)[,1];
num_S <- length(unique(subjects)[,1]); 
num_A <- length(A[,1]); 
n_cols <- dim(clean)[2]; 
final <- clean[1:(num_S*num_A),]

row = 1
for (s in 1:num_S) {
  for (a in 1:num_A) {
    final[row, 1] = unique_S[s]
    final[row, 2] = A[a, 2]
    tmp <- clean[clean$subject==s & clean$activity==A[a, 2], ]
    final[row, 3:n_cols] <- colMeans(tmp[, 3:n_cols])
    row = row+1
  }
}

write.table(final, "Tidy_data_mean_std.txt")    




