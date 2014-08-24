# CodeBook : Getting And Cleaning Data Course Project
====================================================

## Untidy Data Description
[UCI Human Activity Recognition Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) consists of 561 variables collected from a combine 30 training and test subjects completing 6 activities while in possession of a Samsung S2 Smart Phone.  There are also data files related to the activities performed for each collect, relating the activity class to the activity name, and listing the subject;s ID for each collection.

## Data Cleaning Transformations
1. acivity_labels given a header: "Activity_Class_Label", "Activity_Name"
2. features all variables cleaned:
  *Given header: "Feature_ID", "Feature_Name"
  *"\\()" replaced with ""
  *"\\(" replaced with "_"
  *"\\)" replaced with "_"
  *"," replaced with "_"
  *"-" replaced with "_"
  *Last 7 variables trimmed the last character from the string
  *Created vector with logical values where TRUE = a variable ralated to mean, Mean or std
  *Subsetted featureVariable list with logical vector removing all non mean, Mean or std variables
  *Created vector with logical values where FALSE = variable realted to an angle measurement
  *Subsetted featureVariable list with logical vector removing all angle measurement variables
  *"Body" replaced with "Body_"
  *"Gravity" replaced with "Gravity_"
  *"Acc" replaced with "Acceleration_"
  *"Gyro" replaced with "Gyro_"
  *"Mag" replaced with "Magnitude"
  *"Jerk" replaced with "Jerk_"
  *"__" replaced with "_"
  *"mean" replaced with "Mean"
  *"std" replaced with "STD"
7. Ordered tidyData by "Subject_ID" and then by "Activity_Name"
8. Used ddply to use the factor variables "Subject_ID" and "Activity_Name" to subset the data.frame and then calculate the column means using colMeans()
9. wrote tidyData to textfile
  
## Tidy Dataset Variables:
Subject_ID 
Activity_Name
Body_Acceleration_Mean_X
Body_Acceleration_Mean_Y
Body_Acceleration_Mean_Z
Body_Acceleration_STD_X
Body_Acceleration_STD_Y
Body_Acceleration_STD_Z
Gravity_Acceleration_Mean_X
Gravity_Acceleration_Mean_Y
Gravity_Acceleration_Mean_Z
Gravity_Acceleration_STD_X
Gravity_Acceleration_STD_Y
Gravity_Acceleration_STD_Z
Body_Acceleration_Jerk_Mean_X
Body_Acceleration_Jerk_Mean_Y
Body_Acceleration_Jerk_Mean_Z
Body_Acceleration_Jerk_STD_X
Body_Acceleration_Jerk_STD_Y
Body_Acceleration_Jerk_STD_Z
Body_Gyro_Mean_X
Body_Gyro_Mean_Y
Body_Gyro_Mean_Z
Body_Gyro_STD_X
Body_Gyro_STD_Y
Body_Gyro_STD_Z
Body_Gyro_Jerk_Mean_X
Body_Gyro_Jerk_Mean_Y
Body_Gyro_Jerk_Mean_Z
Body_Gyro_Jerk_STD_X
Body_Gyro_Jerk_STD_Y
Body_Gyro_Jerk_STD_Z
Body_Acceleration_Magnitude_Mean
Body_Acceleration_Magnitude_STD
Gravity_Acceleration_Magnitude_Mean
Gravity_Acceleration_Magnitude_STD
Body_Acceleration_Jerk_Magnitude_Mean
Body_Acceleration_Jerk_Magnitude_STD
Body_Gyro_Magnitude_Mean
Body_Gyro_Magnitude_STD
Body_Gyro_Jerk_Magnitude_Mean
Body_Gyro_Jerk_Magnitude_STD
Body_Acceleration_Mean_X.1
Body_Acceleration_Mean_Y.1
Body_Acceleration_Mean_Z.1
Body_Acceleration_STD_X.1
Body_Acceleration_STD_Y.1
Body_Acceleration_STD_Z.1
Body_Acceleration_Jerk_Mean_X.1
Body_Acceleration_Jerk_Mean_Y.1
Body_Acceleration_Jerk_Mean_Z.1
Body_Acceleration_Jerk_STD_X.1
Body_Acceleration_Jerk_STD_Y.1
Body_Acceleration_Jerk_STD_Z.1
Body_Gyro_Mean_X.1
Body_Gyro_Mean_Y.1
Body_Gyro_Mean_Z.1
Body_Gyro_STD_X.1
Body_Gyro_STD_Y.1
Body_Gyro_STD_Z.1
Body_Acceleration_Magnitude_Mean.1
Body_Acceleration_Magnitude_STD.1
Body_Body_Acceleration_Jerk_Magnitude_Mean
Body_Body_Acceleration_Jerk_Magnitude_STD
Body_Body_Gyro_Magnitude_Mean
Body_Body_Gyro_Magnitude_STD
Body_Body_Gyro_Jerk_Magnitude_Mean
Body_Body_Gyro_Jerk_Magnitude_STD

  
  
