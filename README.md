# cgcdproj
Coursera Getting and Cleaning Data Project

This repository was created to share Coursera Getting and Cleaning Data Class Project submission.  

## Files
The repository contains the following files:

* README.md: This file.
* CodeBook.md:  Code book containing information describing variables in data set.
* run_analysis.R:  R script to create the summary data set.

## Background
Details of the original study can be found on the 
[UCI Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) 
web site.  Study involved collecting accelerometer and gyroscope data from
Samsung Galaxy S II while volunteers performed various activities. 

Instructions regarding the class project can be found on the 
[Coursera](https://class.coursera.org/getdata-010/human_grading/view/courses/973497/assessments/3/submissions) web site.  In summary, the objective of the project is
to download study data and then create a summary data set of a specific subset
of the original data set.

## Methodology
Original dataset was downloaded from the following URL:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

1. Test and training sets were merged.

2. Only data columns representing mean and std statistics were retained. 
Specifically, columns with the following strings in the name were retained:
..* -mean()
..* -std()

3. Retained data was augmented with activity information from the original data set.

4. Variables were given descriptive names that were compatible with R.  This
required replacing the following characters "-,()" with R-friendly characters
"._..".  Furthermore, sequences of multiple "." (i.e. "..", "...") were
collapsed to a single "." and trailing "." were removed.

5. Retained data set was augmented with subject identifiers from the original
data set and a summary data set was created.  Summary data set contains
means of the retained data set variables grouped by subject and activity.
