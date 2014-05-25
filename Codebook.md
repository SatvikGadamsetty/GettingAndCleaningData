This code book provides background information about the project and the corresponding run_analysis.R script. The overall objective of this project is acquire, clean, and output tidy data using methods learned from the course.

Original data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Backgound material: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Procedure in run_analysis.R:

1) Read and store files from training and test data sets in R.
2) Merge the training and test data sets to create a single data set. i.e
  - X_train + X_test => X_total
  - Y_train + Y_test => Y_total
3) Read file features and extract unique ones related to means and standard deviations of measurments.
4) Read activity labels in order to assign descriptive activity names in the final data set.
  - Walking
  - WalkingUpstairs
  - WalkingDownstairs
  - Sitting
  - Standing
  - Laying
5) Merge data sets using activity names and subject IDs.
6) Resulting data set has following characteristics:
  - Subjects from range(1,30)
  - Attributes:
  -   tbodyacc-mean-xyz
  -   tbodyacc-std-xyz
  -   tgravityacc-mean-xyz
  -   tgravityacc-std-xyz
