#Code Book

This document describes the variables in the Xt.txt data file which can be created
by running the run_analysis.R script.

1. activity: column contains the subjects activity.  The following are valid
activities: 

    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

2. subject: subject identifier in range [1:30]

3. mean: computed mean for measure

4. measure: study measurement.  The following measuments are included in the
data set:

    * tBodyAcc.mean.X
    * tBodyAcc.mean.Y
    * tBodyAcc.mean.Z
    * tBodyAcc.std.X
    * tBodyAcc.std.Y
    * tBodyAcc.std.Z
    * tGravityAcc.mean.X
    * tGravityAcc.mean.Y
    * tGravityAcc.mean.Z
    * tGravityAcc.std.X
    * tGravityAcc.std.Y
    * tGravityAcc.std.Z
    * tBodyAccJerk.mean.X
    * tBodyAccJerk.mean.Y
    * tBodyAccJerk.mean.Z
    * tBodyAccJerk.std.X
    * tBodyAccJerk.std.Y
    * tBodyAccJerk.std.Z
    * tBodyGyro.mean.X
    * tBodyGyro.mean.Y
    * tBodyGyro.mean.Z
    * tBodyGyro.std.X
    * tBodyGyro.std.Y
    * tBodyGyro.std.Z
    * tBodyGyroJerk.mean.X
    * tBodyGyroJerk.mean.Y
    * tBodyGyroJerk.mean.Z
    * tBodyGyroJerk.std.X
    * tBodyGyroJerk.std.Y
    * tBodyGyroJerk.std.Z
    * tBodyAccMag.mean
    * tBodyAccMag.std
    * tGravityAccMag.mean
    * tGravityAccMag.std
    * tBodyAccJerkMag.mean
    * tBodyAccJerkMag.std
    * tBodyGyroMag.mean
    * tBodyGyroMag.std
    * tBodyGyroJerkMag.mean
    * tBodyGyroJerkMag.std
    * fBodyAcc.mean.X
    * fBodyAcc.mean.Y
    * fBodyAcc.mean.Z
    * fBodyAcc.std.X
    * fBodyAcc.std.Y
    * fBodyAcc.std.Z
    * fBodyAccJerk.mean.X
    * fBodyAccJerk.mean.Y
    * fBodyAccJerk.mean.Z
    * fBodyAccJerk.std.X
    * fBodyAccJerk.std.Y
    * fBodyAccJerk.std.Z
    * fBodyGyro.mean.X
    * fBodyGyro.mean.Y
    * fBodyGyro.mean.Z
    * fBodyGyro.std.X
    * fBodyGyro.std.Y
    * fBodyGyro.std.Z
    * fBodyAccMag.mean
    * fBodyAccMag.std
    * fBodyBodyAccJerkMag.mean
    * fBodyBodyAccJerkMag.std
    * fBodyBodyGyroMag.mean
    * fBodyBodyGyroMag.std
    * fBodyBodyGyroJerkMag.mean
    * fBodyBodyGyroJerkMag.std

Note that measure names are similar but not identical to original study names.
Mapping of measurement names back to those of the original study is relatively
straight forward.  The following characters "-,()" have been substituted with
"._.." and then multiple "."" have been collapsed to a single ".".
In addition, trailing "." have been supressed.
