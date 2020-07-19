############################################
## Coursera's Peer-graded Assignment:
## Getting and Cleaning Data Course Project
############################################
## Author:Kevin Rojas Bohorquez
############################################
## Step 1: Merges the training and the test sets to create one data set.
############################################

### Loading the features names
features<-read.table("UCI HAR Dataset/features.txt",FALSE,sep = "")
### Loading the train data with its columns names
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt",FALSE,
                   sep = "",col.names=features$V2)
### Loading the activity code from train data
ytrain<-read.table("UCI HAR Dataset/train/Y_train.txt",FALSE,
                   sep = "",col.names="codact")
### Loading the subjects from train data
sub_train<-read.table("UCI HAR Dataset/train/subject_train.txt",FALSE,
                      sep = "",col.names="subject")
### Merging the three loaded train datasets with cbind
train<-cbind(xtrain,ytrain,sub_train)

### Loading the test data with its columns names
xtest<-read.table("UCI HAR Dataset/test/X_test.txt",FALSE,
                  sep = "",col.names=features$V2)
### Loading the activity code from test data
ytest<-read.table("UCI HAR Dataset/test/Y_test.txt",FALSE,
                  sep = "",col.names="codact")
### Loading the subjects from test data
sub_test<-read.table("UCI HAR Dataset/test/subject_test.txt",FALSE,
                     sep = "",col.names="subject")
### Merging the three loaded test datasets  with cbind
test<-cbind(xtest,ytest,sub_test)

### Finally, combining both datasets with rbind
mergedata<-rbind(train,test)

############################################
## Step 2: Extracts only the measurements on the mean and
##         standard deviation for each measurement.
############################################

### Filtering the required columns with grepl and regular expressions
stdandmean<-names(mergedata)[grepl(".(std\\.|mean\\.|odac|ubjec).",
                                  names(mergedata))]
### Creating the new dataset with the required columns
mergemean_avg<-mergedata[,stdandmean]

############################################
## Step 3: Uses descriptive activity names to name
##         the activities in the data set.
############################################

### Loading the descriptive activity names
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",FALSE,
                            sep = "",col.names=c("codact","activity"))
### Merging the activites names dataset and our dataset by codact
datam<-merge(mergemean_avg,activity_labels,by = "codact")
### Dropping the column codact
datam<-datam[,-1]

############################################
## Step 4: Appropriately labels the data set with
##         descriptive variable names.
############################################

### Deleting '.' from variable names
names(datam)<-gsub("\\.","",names(datam))
### getting lowercase varible names
names(datam)<-tolower(names(datam))
### Correcting the current mistakes
names(datam)<-sub("bodybody","body",names(datam))
names(datam)<-sub("bodygyro","gyro",names(datam))
### Replacing the domain of the variables
names(datam)<-sub("^t","time",names(datam))
names(datam)<-sub("^f","frequency",names(datam))
### Changing gyro to angularvelocity in order to be more accurate
names(datam)<-sub("gyro","angularvelocity",names(datam))
### Changing acc to accelaration in order to avoid abbreviation
names(datam)<-sub("acc","acceleration",names(datam))
### Changing mag to length in order to avoid abbreviation
names(datam)<-sub("mag","length",names(datam))
### Changing places of mean and directions XYZ
names(datam)<-sub(".meanx$","xmean",names(datam))
names(datam)<-sub(".meany$","ymean",names(datam))
names(datam)<-sub(".meanz$","zmean",names(datam))
### Changing places of std and directions XYZ
names(datam)<-sub(".stdx$","xstd",names(datam))
names(datam)<-sub(".stdy$","ystd",names(datam))
names(datam)<-sub(".stdz$","zstd",names(datam))

############################################
## Step 5: From the data set in step 4, creates a second, independent
##         tidy data set with the average of each variable for each 
##         activity and each subject.
############################################

### Loading the library dplyr in order to complete this task
library("dplyr")
### Using pipes, first, group by subject, activity and then  summarise with mean function at all the variables
group<-datam %>% group_by(subject,activity) %>%
  summarise_at(vars(timebodyacceleratioxmean:frequencyangularvelocityjerklengthstd),
               mean)

############################################
## Finally, we create the tidy datasets
############################################

write.csv(datam,"tidydata/tidy.csv",row.names=FALSE)
write.csv(group,"tidydata/tidygroup.csv",row.names=FALSE)