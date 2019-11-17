#Task 1

##Reading train and test 
test_x_dest<-"./UCI HAR Dataset/test/X_test.txt"
test_x<-read.table(test_x_dest)

test_y_dest<-"./UCI HAR Dataset/test/y_test.txt"
test_y<-read.table(test_y_dest)

train_x_dest<-"./UCI HAR Dataset/train/X_train.txt"
train_x<-read.table(train_x_dest)

train_y_dest<-"./UCI HAR Dataset/train/y_train.txt"
train_y<-read.table(train_y_dest)

##Reading and transposing column names
cnames_dest<-"./UCI HAR Dataset/features.txt"
cnames<-read.table(cnames_dest)
cnames_t<-t(cnames)
cnames_t_f<-cnames_t[2, ]

##Reading subject identificators
subject_test_dest<-"./UCI HAR Dataset/test/subject_test.txt"
subject_test<-read.table(subject_test_dest)

subject_train_dest<-"./UCI HAR Dataset/train/subject_train.txt"
subject_train<-read.table(subject_train_dest)


##Table joining
test<-cbind(subject_test, test_y, test_x)
train<-cbind(subject_train, train_y, train_x)
all_data<-rbind(train, test)
colnames (all_data)<-c("SubjectID", "Activity", cnames_t_f)


#Task 2
##Selection columns containing mean and standard deviation
mean_std<-all_data[ , grep("-mean\\(\\)|-std\\(\\)", colnames(all_data))]

##Adding columns "SubjectID" and "Activity"
mean_std<-cbind(all_data$SubjectID, all_data$Activity, mean_std)
colnames(mean_std)[1:2]<-c("SubjectID", "Activity")

#Task 3-4
##Assigning character names to integer values and making new column with responding character names of activities 
mean_std$ActivityName <- factor(mean_std$Activity,
                    levels = c(1,2,3,4,5,6),
                    labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
                    )
mean_std<-subset(mean_std,select = c(SubjectID, Activity, ActivityName, 3:68))

##Renaming column names for easier understanding
colnames(mean_std) <- gsub("^t", "Time", colnames(mean_std))
colnames(mean_std) <- gsub("^f", "Frequency", colnames(mean_std))
colnames(mean_std) <- gsub("Acc", "Accelerometer", colnames(mean_std))
colnames(mean_std) <- gsub("Gyro", "Gyroscope", colnames(mean_std))
colnames(mean_std) <- gsub("Mag", "Magnitude", colnames(mean_std))

#Task 5
##Making dataset with means of all variables by activity and subjects
means<-aggregate(.~SubjectID+ActivityName, mean_std, mean)
##Deleting column "Activity" that is not needed now
means$Activity<-NULL
##Saving tidy dataset in .csv format
write.csv(means, "tidy_dataset.csv", row.names=F)