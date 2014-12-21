rm(list=ls(all=TRUE))  #first delete all laoded variables from the environment

#set working directories, load data, merge training and test data and create variable names

setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data/UCI HAR Dataset/train")
trsubject <- read.table("subject_train.txt")
setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data/UCI HAR Dataset/test")
tesubject <- read.table("subject_test.txt")
subject <- rbind(trsubject,tesubject)
colnames(subject) <- "subject"


setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data/UCI HAR Dataset/train")
X <- read.table("X_train.txt")
y <- read.table("y_train.txt")
setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data/UCI HAR Dataset/test")
tX <- read.table("X_test.txt")
ty <- read.table("y_test.txt")
X <- rbind(X,tX)
y <- c(y$V1,ty$V1)

setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data/UCI HAR Dataset")
feat_names <- read.table("features.txt")
colnames(X) <- feat_names[,2]

activity_labels <- read.table("activity_labels.txt")
activity <- array(NA,length(y))
for (i in 1:length(y)) {activity[i] <- as.character(activity_labels$V2[y[i]])}

setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data/UCI HAR Dataset/train/Inertial Signals")
body_acc_x <- read.table("body_acc_x_train.txt")
body_acc_y <- read.table("body_acc_y_train.txt")
body_acc_z <- read.table("body_acc_z_train.txt")

body_gyro_x <- read.table("body_gyro_x_train.txt")
body_gyro_y <- read.table("body_gyro_y_train.txt")
body_gyro_z <- read.table("body_gyro_z_train.txt")

total_acc_x <- read.table("total_acc_x_train.txt")
total_acc_y <- read.table("total_acc_y_train.txt")
total_acc_z <- read.table("total_acc_z_train.txt")

setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data/UCI HAR Dataset/test/Inertial Signals")
tbody_acc_x <- read.table("body_acc_x_test.txt")
tbody_acc_y <- read.table("body_acc_y_test.txt")
tbody_acc_z <- read.table("body_acc_z_test.txt")

tbody_gyro_x <- read.table("body_gyro_x_test.txt")
tbody_gyro_y <- read.table("body_gyro_y_test.txt")
tbody_gyro_z <- read.table("body_gyro_z_test.txt")

ttotal_acc_x <- read.table("total_acc_x_test.txt")
ttotal_acc_y <- read.table("total_acc_y_test.txt")
ttotal_acc_z <- read.table("total_acc_z_test.txt")

bodyacc_x <- rbind(body_acc_x,tbody_acc_x)
bodyacc_y <- rbind(body_acc_y,tbody_acc_y)
bodyacc_z <- rbind(body_acc_z,tbody_acc_z)

bodyacc_x_names  <- array(NA,dim(bodyacc_x)[2])
for (i in 1:dim(bodyacc_x)[2]) {bodyacc_x_names[i] <- paste("bodyacc_x",i,sep="")}

bodyacc_y_names  <- array(NA,dim(bodyacc_y)[2])
for (i in 1:dim(bodyacc_y)[2]) {bodyacc_y_names[i] <- paste("bodyacc_y",i,sep="")}

bodyacc_z_names  <- array(NA,dim(bodyacc_z)[2])
for (i in 1:dim(bodyacc_z)[2]) {bodyacc_z_names[i] <- paste("bodyacc_z",i,sep="")}

colnames(bodyacc_x) <- bodyacc_x_names
colnames(bodyacc_y) <- bodyacc_y_names
colnames(bodyacc_z) <- bodyacc_z_names

bodygyro_x <- rbind(body_gyro_x,tbody_gyro_x)
bodygyro_y <- rbind(body_gyro_y,tbody_gyro_y)
bodygyro_z <- rbind(body_gyro_z,tbody_gyro_z)

bodygyro_x_names  <- array(NA,dim(bodygyro_x)[2])
for (i in 1:dim(bodygyro_x)[2]) {bodygyro_x_names[i] <- paste("bodygyro_x",i,sep="")}
bodygyro_y_names  <- array(NA,dim(bodygyro_y)[2])
for (i in 1:dim(bodygyro_y)[2]) {bodygyro_y_names[i] <- paste("bodygyro_y",i,sep="")}
bodygyro_z_names  <- array(NA,dim(bodygyro_z)[2])
for (i in 1:dim(bodygyro_z)[2]) {bodygyro_z_names[i] <- paste("bodygyro_z",i,sep="")}

colnames(bodygyro_x) <- bodygyro_x_names
colnames(bodygyro_y) <- bodygyro_y_names
colnames(bodygyro_z) <- bodygyro_z_names

totalacc_x <- rbind(total_acc_x,ttotal_acc_x)
totalacc_y <- rbind(total_acc_y,ttotal_acc_y)
totalacc_z <- rbind(total_acc_z,ttotal_acc_z)

totalacc_x_names  <- array(NA,dim(totalacc_x)[2])
for (i in 1:dim(totalacc_x)[2]) {totalacc_x_names[i] <- paste("totalacc_x",i,sep="")}
totalacc_y_names  <- array(NA,dim(totalacc_y)[2])
for (i in 1:dim(totalacc_y)[2]) {totalacc_y_names[i] <- paste("totalacc_y",i,sep="")}
totalacc_z_names  <- array(NA,dim(totalacc_z)[2])
for (i in 1:dim(totalacc_z)[2]) {totalacc_z_names[i] <- paste("totalacc_z",i,sep="")}

colnames(totalacc_x) <- totalacc_x_names
colnames(totalacc_y) <- totalacc_y_names
colnames(totalacc_z) <- totalacc_z_names

#combine everything into one data set
smartphonesData <- cbind(subject,activity,X,bodyacc_x,bodyacc_y,bodyacc_z,bodygyro_x,bodygyro_y,bodygyro_z,totalacc_x,totalacc_y,totalacc_z)
colnames(smartphonesData) <- c("subject","activity",names(X),names(bodyacc_x),names(bodyacc_y),names(bodyacc_z),names(bodygyro_x),names(bodygyro_y),names(bodygyro_z),names(totalacc_x),names(totalacc_y),names(totalacc_z))

#extract only the measurements on the mean and standard deviation for each measurement
meansSDs <- smartphonesData[,3:8]

#create a second, independent tidy data set with the average of each variable for each activity and each subject
activs <- split(smartphonesData,smartphonesData$activity)
smartphonesMeans <- array(NA,dim=c(length(table(smartphonesData$subject)),length(table(smartphonesData$activity)),dim(smartphonesData)[2]-2))
for (i in 1:length(table(smartphonesData$activity))) {
        cur.dat <- activs[[i]]
        print(paste("i=",i))
        for (j in 1:length(table(smartphonesData$subject))) {
                current.dat     <-    cur.dat[cur.dat$subject==j,]
                print(paste("j=",j))
                for (k in 3:dim(smartphonesData)[2]) {
                        smartphonesMeans[j,i,k-2] <- mean(current.dat[,k],na.rm=T)
                        print(paste("k=",k))
                }
        }
}
 
smartphonesFinal <- NULL
for (i in 1:length(table(smartphonesData$activity))) {
        smartphonesFinal <- rbind(smartphonesFinal,smartphonesMeans[,i,])
}

indices <- expand.grid(1:30,1:6)

smartphonesFinal <- cbind(indices[,2],indices[,1],smartphonesFinal)

colnames(smartphonesFinal) <- c("activity","subject",colnames(smartphonesData)[3:dim(smartphonesData)[2]])

#smartphonesFinal is the final data set with the average of each variable for each activity and each subject

setwd("/Users/jenny/Dropbox/Work/Coursera/Data Science/Exercises/Getting data")
save(smartphonesFinal,file="smartphonesFinal.Rdata")
save(meansSDs,file="means_SDs.Rdata")
