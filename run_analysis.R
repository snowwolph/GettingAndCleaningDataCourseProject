################################################################################
## run_analysis.R
##
## run_analysis.R - Cleans and creates a tidy dataset for the UCI HAR Dataset
##
## Description - loads, cleans the data and ceates clear understandable variable
##    names, then takes the average of the mean and standard deviation variables
##    data for each activity and each subject.
##
##
## Author - Gregg O'Marr
## Date - 23 August 2014
## Version - 1.0
###############################################################################

## Clear WorkSpace
rm(list=ls())

################################################################################
##
##    Data Set Data
##
################################################################################

## Read activity_labels.txt, links the activity names with their class labels in the 
##    Y_train training labels and Y_test test labels files 
activityLabels <- read.delim( "./activity_labels.txt",
                              header = FALSE,
                              sep = " ",
                              col.names = c( "Activity_Class_Label", 
                                             "Activity_Name") )

## Read features.txt the features variables to the X_train data
featureVariablesOrig <- read.delim( "./features.txt",
                                header = FALSE,
                                sep = " ",
                                col.names = c( "Feature_ID", 
                                               "Feature_Name" ) )

## Clean variable names
featureVariables <- gsub( "\\()", "", featureVariablesOrig$Feature_Name )
featureVariables <- gsub( "\\(", "_", featureVariables )
featureVariables <- gsub( "\\)", "_", featureVariables )
featureVariables <- gsub( ",", "_", featureVariables )
featureVariables <- gsub( "-", "_", featureVariables )
featureVariables <- c( featureVariables[1:554], 
                       substr( featureVariables[555:561], 
                               1, 
                               nchar( featureVariables[ 555:561 ] ) - 1 ) )
meanMeanStdVariables <- grepl( "mean|Mean|std", featureVariables )
featureVariables <- featureVariables[ meanMeanStdVariables ]

meanFreqAndAngleVariables <- !grepl( "meanFreq|angle", featureVariables )
featureVariables <- featureVariables[ meanFreqAndAngleVariables ]
featureVariables <- sub( "t|f", "", featureVariables )
featureVariables <- gsub( "Body", "Body_", featureVariables )
featureVariables <- gsub( "Gravity", "Gravity_", featureVariables )
featureVariables <- gsub( "Acc", "Acceleration_", featureVariables )
featureVariables <- gsub( "Gyro", "Gyro_", featureVariables )
featureVariables <- gsub( "Mag", "Magnitude", featureVariables )
featureVariables <- gsub( "Jerk", "Jerk_", featureVariables )
featureVariables <- gsub( "__", "_", featureVariables )
featureVariables <- gsub( "mean", "Mean", featureVariables )
featureVariables <- gsub( "std", "STD", featureVariables )

################################################################################
##
##    Training Data
##
################################################################################

## Read subject_train.txt the training subject data ID
subjectTrain <- read.table( "./train/subject_train.txt", 
                            quote = "\"", 
                            col.names = c( "Subject_ID" ) )

## Read Y_train.txt the training activity ID related to each training 
##    observation
activityTrainingClassLabel <- read.table( "./train/Y_train.txt", 
                                          quote = "\"", 
                            col.names = c( "Activity_Class_Labels" ) )

## Read X_train.txt the training observation data 
xTrainingData <- read.table( "./train/X_train.txt", 
                             quote = "\"" )
                      
## Reduce xTrain data to desired Mean and STD variables for all observations
## Select all variable columns referencing mean, Mean and STD
xTrainingDataTidy <- xTrainingData[ , meanMeanStdVariables ]
## Remove all variable columns referencing meanFreq and Angle.  Training data 
##    now consists of 66 variables consisting of measurements of mean and 
##    standard deviation for each measurement within the training data
xTrainingDataTidy <- xTrainingDataTidy[ , meanFreqAndAngleVariables ]
names( xTrainingDataTidy ) <- featureVariables

## Create Data_Set_ID variable to ID the observations a Training related data
dataSetIDTrain <- 
      as.data.frame( 
            as.character( 
                  rep( "Training", 
                       length( subjectTrain[[1]] ) ) ) )
names( dataSetIDTrain ) <- "Data_Set_ID"

## Convert data.frame to factor vector
activityTrainingClassLabelFactor <- as.factor( 
      activityTrainingClassLabel$Activity_Class_Labels )

## Convert Activity_Class_Labels to Activity_Name using Avtivity_Class_ Label 
##    factor vector
activityNameTrainingTidy <- 
      as.data.frame( 
            activityLabels$Activity_Name[ activityTrainingClassLabelFactor ] )
names( activityNameTrainingTidy ) <- "Activity_Name"

## Combine Subject_ID, Activity_Class_Label, Data_Set_ID and variables data 
trainingDataTidy <- 
      cbind( subjectTrain, 
             activityNameTrainingTidy, 
             dataSetIDTrain, 
             xTrainingDataTidy )

################################################################################
##
##    Test Data
##
################################################################################

## Read subject_train.txt the training subject data ID
subjectTest <- read.table( "./test/subject_test.txt", 
                           quote = "\"", 
                            col.names = c( "Subject_ID" ) )

## Read Y_train.txt the training activity ID related to each training 
##    observation
activityTestClassLabel <- read.table( "./test/Y_test.txt", 
                                      quote = "\"",
                               col.names = c( "Activity_Class_Labels" ) )

## Read X_train.txt the training observation data 
xTestData <- read.table( "./test/X_test.txt",
                         quote = "\"" )

## Reduce xTrain data to desired Mean and STD variables for all observations
## Select all variable columns referencing mean, Mean and STD
xTestDataTidy <- xTestData[ , meanMeanStdVariables ]
## Remove all variable columns referencing meanFreq and Angle.  Training data 
##    now consists of 66 variables consisting of measurements of mean and 
##    standard deviation for each measurement within the training data
xTestDataTidy <- xTestDataTidy[ , meanFreqAndAngleVariables ]

names( xTestDataTidy ) <- featureVariables

## Create Data_Set_ID variable to ID the observations a Test related data
dataSetIDTest <- 
      as.data.frame( 
            as.character( 
                  rep( "Test", 
                       length( subjectTest[[1]] ) ) ) )
names( dataSetIDTest ) <- "Data_Set_ID"

## Convert data.frame to factor vector
activityTestClassLabelFactor <- as.factor( 
      activityTestClassLabel$Activity_Class_Labels )

## Convert Activity_Class_Labels to Activity_Name using Avtivity_Class_ Label 
##    factor vector
activityNameTestTidy <- 
      as.data.frame( 
            activityLabels$Activity_Name[ activityTestClassLabelFactor ] )
names( activityNameTestTidy ) <- "Activity_Name"

## Combine Subject_ID, Activity_Class_Label, Data_Set_ID and variables data 
testDataTidy <- cbind( subjectTest, 
                       activityNameTestTidy, 
                       dataSetIDTest, 
                       xTestDataTidy )

################################################################################
##
##    Merging Data
##
################################################################################

## Combine Training and Test data
tidyData <- rbind( trainingDataTidy, testDataTidy, deparse.level = 0 )

## Order Data first by Subject_ID and then by Activity_Class_Label
tidyData <- tidyData[ order( tidyData[ 1 ], tidyData[ 2 ] ), ]

## Calculate the average of each variable for each activity and each subject
UCI_HumanActivityRecognition_Tidy_Dataset <- ddply( 
                                          tidyData, 
                                          .( Subject_ID, Activity_Name ), 
                                          function( x ) colMeans( 
                                                x[ , c( 4 : 69 ) ]) )
write.table( UCI_HumanActivityRecognition_Tidy_Dataset, 
             file = "./UCI_HumanActivityRecognition_Tidy_Dataset.txt",
             row.name = FALSE)