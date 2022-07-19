# Load dplyr package
library(dplyr)

# Read in MechaCar_mpg.csv file and create a dataframe
mechacar_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Generate multiple linear regression model for mpg from the dataframe
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_df)


# Use summary() to determine p-value and r-squared value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_df))

# Read in Suspension_Coil.csv file and create a dataframe
suspension_coil_df <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- suspension_coil_df %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

# creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- suspension_coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

# First create a sample table of the overall population table
suspension_coil_sample_table <- suspension_coil_df %>% sample_n(50) #randomly sample 50 data points

# use t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch. 
t.test(suspension_coil_sample_table$PSI,mu=mean(suspension_coil_df$PSI))

# 3 more scripts to determine if the PSI for EACH of the manufacturing lots is statistically different from the population

# Lot 1
t.test(suspension_coil_sample_table$PSI,mu=mean(suspension_coil_df$PSI),subset(suspension_coil_sample_table["Manufacturing_Lot"])=='Lot1')

# Lot 2
t.test(suspension_coil_sample_table$PSI,mu=mean(suspension_coil_df$PSI),subset(suspension_coil_sample_table["Manufacturing_Lot"])=='Lot2')

# Lot 3
t.test(suspension_coil_sample_table$PSI,mu=mean(suspension_coil_df$PSI),subset(suspension_coil_sample_table["Manufacturing_Lot"])=='Lot3')




