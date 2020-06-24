setwd("C:\\Users\\Emfsupport.kwb1\\Downloads\\Analytics Vidya\\Black Friday sales")
train_data=read.csv("train.csv",stringsAsFactors = F)
test_data=read.csv("test.csv",stringsAsFactors = F)
train_data$data="train"
test_data$data="test"
test_data$Purchase=NA
Bf_sales=rbind(train_data,test_data)
library(dplyr)
glimpse(Bf_sales)
lapply(Bf_sales, function(x) sum(is.na(x)))
table(Bf_sales$Gender)
Bf_sales$Gender=ifelse(Bf_sales$Gender=="M",1,0)
glimpse(Bf_sales)
table(Bf_sales$Age)
Bf_sales$Age=ifelse(Bf_sales$Age=="0-17","00-17",Bf_sales$Age)
Bf_sales$Age=ifelse(Bf_sales$Age=="55+","55-00",Bf_sales$Age) 
glimpse(Bf_sales)
table(Bf_sales$Occupation)
mean1=function(x){
  z=mean(x,na.rm = T)
  return(z)
}
sort(round(tapply(Bf_sales$Purchase,Bf_sales$Occupation,mean1),0))

