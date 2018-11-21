
#Loading the data in R as comma separated values and storing in variable 'Dataset'
Dataset <- read.csv(file.choose())

#Function file.choose() is a default function to open the Windows Explorer and let's the user choose the required file
#We then choose the file INFM600_CleanedLA.csv and use the below command to confirm that the data has correctly loaded
View(Dataset)
head(Dataset)
summary(Dataset)
#The head commands returns the top six rows of the dataset which enables the user to confirm the data
#We have three research questions to predict trends in different cities for Bicycle sharing
#Q1. 1.	How can Seattle create the best bike share system based on trends from New York, Chicago, and Los Angeles?(Variables: Trip Duration in Seconds, Plan Duration, Start Station, End Stataion)
#For the above variables we plot the histograms and check the normality of the distribution. The central tendency for a normally distributed variable would be  
#mean and the central tendency of a skewed distribution would be median
#We plot the histogram using the hist(dataset$variable) command
hist(Dataset$durationInSeconds)
hist(Dataset$plan_duration)

#Inspecting the histograms for the above variables, we understand that they are skewed in nature and hence we calculate the mean as central tendency, median and standard deviation for
#each variable using commands mean(variable), median(variable) and sd(variable). We also add na.rm=TRUE to ignore NuLL values.
mean(Dataset$durationInSeconds, na.rm = TRUE)  #value = 2207.17
sd(Dataset$durationInSeconds, na.rm = TRUE)  #value = 7383.015
median(Dataset$durationInSeconds, na.rm = TRUE)  #value = 720

mean(Dataset$plan_duration, na.rm = TRUE) #value = 28.55
sd(Dataset$plan_duration, na.rm = TRUE)   #value = 62.16511
median(Dataset$plan_duration, na.rm = TRUE) #value = 30


#We use the plot function to determine the relationship between trip duration and plan duration of users. The x-axis has Trip Duration and the y-axis has Plan Duration.
#We're using the abline function to determine is the two variables have a linear relationship.
#We will be using linear regression to determine trends. We will convert lpan duration in seconds and trip duration in seconds in future to maintain relationship analysis.
#Regression estimates are used to describe data and to explain the relationship between one dependent variable and one or more independent variables.
#At the center of the regression analysis is the task of fitting a single line through a plot.Hence the plot() command used with abline()  
scatter.smooth(Dataset$durationInSeconds, Dataset$plan_duration)
LA_plot <- lm(Dataset$durationInSeconds~Dataset$durationInSeconds)


#Since we can see that the relationship between plan and trip duration is connected but not exponentially we will delve further and determine if they have any correlation
#cor() computes the correlation of x and y if these are vectors. If x and y are matrices then the covariances (or correlations) between the columns of x and the columns of y are computed.
cor(Dataset$durationInSeconds, plan_duration) #value = -0.071 implying the relationship is almost linear and strongly correlated


#We now attempt to build linear regression model on full data using the lm() function.
#We also use the summary() function to find the Residual standard error, Significance codes and RSquare values
linearMod <- lm(durationInSeconds ~ plan_duration) 
print(linearMod)   #Intercept = 2449.323 and Plan duration = -8.479
summary(linearMod)   


#Further analysis of the reseach question has to be done by assigning weights to all trip durations from all datasets 
#inspecting their effect on Plan duration, Station from and Station to. Team MAKers continues to work 
#on how to analyze further 
