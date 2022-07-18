# Load dplyr package
library(dplyr)

# Read in MechaCar_mpg.csv file and create a dataframe
mechacar_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Generate multiple linear regression model for mpg from the dataframe
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_df)


# Use summary() to determine p-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_df))
