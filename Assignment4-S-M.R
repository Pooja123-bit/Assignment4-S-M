library("tidyverse")
load(file="fish_data.Rdata")
f=fish;rm(fish)

#tapply & merge

#Using the tapply function, find the mean of 'parcel.density.m3' 
#for each transect and assign the outcome to an object

M<-tapply(fish$parcel.density.m3,fish$transect.id, mean)
M

#Convert the object to a data frame

df.M<- as.data.frame(M)
df.M

#Rename the column with the density values to something more descriptive

colnames(df.M) = "mean density"  
df.M

#Assign the row names of the data frame to be the values 
#in a new field "transect"

transect=rownames(df.M)
rownames(df.M)=NULL
M1.df=cbind(transect,df.M)
M1.df

#Repeat the above steps, but this time using the tapply function
#to find the standard deviation of 'parcel.density.m3'

J<-tapply(fish$parcel.density.m3,fish$transect.id, sd)
J

df.J<- as.data.frame(J)
df.J

colnames(df.J) = "sd density"  
df.J

transect=rownames(df.J)
rownames(df.J)=NULL
J1.df=cbind(transect,df.J)
J1.df

#Using the merge function, combine the data frames with the mean 
#and standard deviation to create one, new data frame that has three columns (mean density, sd density, transect)

P1.df<-merge(x=M1.df, y=J1.df, by = "transect")
P1.df

#Repeat the above steps, but this time using the tapply function to find the count of observations for each transect for 'parcel.density.m3''

C<-tapply(f$parcel.density.m3,f$transect.id, sum)
C

df.C<- as.data.frame(C)
df.C

colnames(df.C)="count"
df.C

transect=rownames(df.C)
rownames(df.C)=NULL
C1.df=cbind(transect,df.C)
C1.df

