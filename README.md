ReadMe: Getting and cleaning data Course Project
================================================

The R script run_analysis.R reads in the data from the files
* X_test.txt
* y_test.txt
* subject_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt
* activity_labels.txt
* features.txt
provided that they are stored in the current working directory.

The first six of these files are used to create a merged data set with added subject and activity identifiers. The last two are used to label activities and name the variables in the data.

According to the description of the sets, there are sets for the actual data (test and training), sets identifying the activity performed and the subject performing the activity. These should be merged into one dataset. Then, there is a set of Labels for the activities which should feature as labels for the activity performed, and a set of variable names for the variables in the original datasets.
First, test and train sets are combined into one dataset. Activity labels and subject labels are combined as well from the test and training data. Then, the activity numbers will be labeled with the activity names and transformed into a factor. The subject numbers are formatted as factor levels as well.
Next, the variable names for the variables in the test and training data are obtained from the features dataset and applied to the column names of the dataset. Then, only variables containing means oder standard deviations are identified. These variables are combined with subject and activity identifiers to create a tidy dataset (result of step 4). It contains a total of 10299 observations on subject, activity and a total of 66 variables of mean and standard deviation measurements collected from the accelerometers of Samsung Galaxy Smartphones.

From the dataset created in step 4 a new dataset is created, containing only the average of each of the accerlerometer variables for each activity and subject. There are 6 activities * 30 subjects = 180 observations in this set, with data on activity + subject + 66 variables on the means of the originally selected means and standard deviation variables. The obtained data is stored in a file named "meandata.txt".

In order to inspect the new dataset provided as part of the assignment, it should be downloaded to the computer,
stored in the current working directory for R an then read in using:
* newdata<-read.table("meandata.txt", header=TRUE)
-provided that meandata.txt has been stored in the current working directory.
* View(newdata)
enables to inspect the created dataset.

