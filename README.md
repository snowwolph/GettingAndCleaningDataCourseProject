# README.md
## For Getting And Cleaning Data Course Project
===============================================

Repo for the Getting nad Cleaning Data Course Project: Creating a Tidy Dataset for UCI HAR Dataset

1. Download the run_analysis.R script.
2. Place run_analysis.R in the same directory as the following UCI HAR Dataset files and data folders:
  *'test' folder
  *'train' folder
  *activity_labels.txt
  *features.txt
  *features_info.txt
  *README.txt
3. run the following code:

    source('<YOUR_DIRECTORY_PATH>/run_analysis.R')
    
    where '<YOUR_DIRECTORY_PATH>' should be replaced with the directory path from 'ROOT' to the directory containing the files         and folders referenced in 'STEP 2' and should also contain the run_analysis.R script file.
4. If using RStudio type (or preferably "Cut & Paste") the following code into your console to see the final tidy dataset:

    View(UCI_HumanActivityRecognition_Tidy_Dataset)
    
    where the 'V' in 'View' is capitalized.
