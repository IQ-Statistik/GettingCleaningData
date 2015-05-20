## Getting and Cleaning Data Course Project

## Reading in the data
## Assuming the files have already been downloaded to the current working directory
xtest<-read.table("X_test.txt")
ytest<-read.table("y_test.txt")
stest<-read.table("subject_test.txt")
xtrain<-read.table("X_train.txt")
ytrain<-read.table("y_train.txt")
strain<-read.table("subject_train.txt")
label<-read.table("activity_labels.txt")
features<-read.table("features.txt")
## Gaining a first overview of the available data to see how they might fit together
str(xtest)
str(ytest)
str(stest)
str(xtrain)
str(ytrain)
str(strain)
str(label)
str(features)

## According to the description of the sets, there is a set for the actual data (xtrain, xtest), a set identifying the activity performed (ytrain, ytest) and
## one identifiying subject performing the activity (strain, stest). These should be merged into one dataset.
## Then, there is a set of Labels for the activities (labels) which should feature as labels for the activity performed, and a set of
## variable names for the variables in the original datasets (features).
## First, test and train sets are combined into one dataset. Activity labels and subject labels are combined as well.
## Using rbind, the order of the sets will remain the same.
data<-rbind(xtest, xtrain)
activity<-rbind(ytest, ytrain)
subject<-rbind(stest, strain)
## Then, the activity numbers will be labeled with the activity names and transformed into a factor.
activity<-factor(activity$V1, labels=label$V2)
## It makes sense to transform subject identifiers into a factor as well.
subject<-factor(subject$V1)
## Variable names are to be found in the features set. They can be used as names for the activities in the data.
names(data)<-features$V2
## Identify variables giving mean oder std on the measures and selecting them
vmean<-grepl("mean()", features$V2, fixed=TRUE)
vstd<-grepl("std()", features$V2, fixed=TRUE)
vsel<-(vmean|vstd)
## Finally, the data is reduced to those variables containing means and stds, then subject and activity identifiers are added.
data<-cbind(subject, activity, data[,vsel])
## data is the tidy dataset created in step 4 of the instructions

## Creating a new dataset with averages of each variable for each activity and subject
## Using plyr and package
## install.packages("plyr") ## Only need to be installed once
library(plyr)
newdata<-ddply(data, .(subject, activity), colwise(mean))
write.table(newdata, "meandata.txt", row.names=FALSE)
