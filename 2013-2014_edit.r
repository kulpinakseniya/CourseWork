#Редактирование данных сезона 2013-2014. Удаление данных с этапов КМ после ОИ.

setwd('/Users/DNS1/Documents/Rstudio/course')
data = read.csv("2013-2014.csv", sep = ";")
summary(data)

points <- c(60,54,48,43,40,38,36,34,32,31,30,29,28,27,26,25,24,
            23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5)
ms_points <- c(60,54,48,43,40,38,36,34,32,31,30,29,28,27,26,
               25,24,23,22,21,20,18,16,14,12,10,8,6,4,2)



data$TO = 0;
data$IN = 0;
data$SP = 0;
data$PU = 0;
data$MS = 0;
data$R = 0;
data$R1 = 0;
data$R2 = 0;
data$R3 = 0;
data$R10 = 0;
data$PA = 0;

colnames(data)

# if (as.numeric(data[9,23]) < 37)
# {
#   x <- 3
# }
# 
# if (as.numeric(data[9,23]) < 10)
# {
#   y <- 3
# }
#data[2,30]
# value <- as.numeric(as.character(data[,19]))
# value[1]

for (k in 19:31)
{
  
  value <- as.numeric(as.character(data[,k]))
  if ((colnames(data)[k] == 'SP.1') || (colnames(data)[k] == 'SP.2') || (colnames(data)[k] == 'SP.3') || (colnames(data)[k] == 'SP.4'))
     {
       for (j in 1:199)
       {
         if ((!is.na(data[j,k])) && (data[j,k] != '') && data[j,k] != 'DNF')
         {
           data$R[j] <- data$R[j] + 1;
          
           
         if (value[j] < 37)
         {
           data$SP[j] <- data$SP[j] + points[value[j]];
           data$PA[j] <- data$PA[j] + 1;
         }
         if (value[j] < 11)
         {
           data$R10[j] <- data$R10[j] + 1
         }
         if (value[j] == 1)
         {
           data$R1[j] <- data$R1[j] + 1;
         }
         if (value[j] == 2)
         {
           data$R2[j] <- data$R2[j] + 1;
         }
         if (value[j] == 3)
         {
           data$R3[j] <- data$R3[j] + 1;
         }
         }
     
       }
     }
    else if ((colnames(data)[k] == 'PU.1') || (colnames(data)[k] == 'PU.2') || (colnames(data)[k] == 'PU.3'))
    {
         for (j in 1:199)
         {
           if ((!is.na(data[j,k])) && (data[j,k] != '') && (data[j,k] != 'DNF'))
           {
             data$R[j] <- data$R[j] + 1;
             #value <- as.numeric(levels(data[,k])[data[,k]])
             
           if (value[j] < 37)
           {
             data$PU[j] <- data$PU[j] + points[value[j]];
             data$PA[j] <- data$PA[j] + 1;
           }
           if (value[j] < 11)
           {
             data$R10[j] <- data$R10[j] + 1
           }
           if (value[j] == 1)
           {
             data$R1[j] <- data$R1[j] + 1;
           }
           if (value[j] == 2)
           {
             data$R2[j] <- data$R2[j] + 1;
           }
           if (value[j] == 3)
           {
             data$R3[j] <- data$R3[j] + 1;
           }
           }
         }
       }
       else if (colnames(data)[k] == 'IN.1')
       {
         for (j in 1:199)
         {
           if ((!is.na(data[j,k])) && (data[j,k] != '') && (data[j,k] != "DNF'"))
           {
             data$R[j] <- data$R[j] + 1;
             #value <- as.numeric(levels(data[,k])[data[,k]])
  
           if (value[j] < 37)
           {
             data$IN[j] <- data$IN[j] + points[value[j]];
             data$PA[j] <- data$PA[j] + 1;
           }
           if (value[j] < 11)
           {
             data$R10[j] <- data$R10[j] + 1
           }
           if (value[j] == 1)
           {
             data$R1[j] <- data$R1[j] + 1;
           }
           if (value[j] == 2)
           {
             data$R2[j] <- data$R2[j] + 1;
           }
           if (value[j] == 3)
           {
             data$R3[j] <- data$R3[j] + 1;
           }
           }
         }
       }
       else if (colnames(data)[k] == 'MS.1')
       {
         for (j in 1:199)
         {
           if ((!is.na(data[j,k])) && (data[j,k] != '') && (data[j,k] != 'DNF'))
           {
             data$R[j] <- data$R[j] + 1;
             #value <- as.numeric(levels(data[,k])[data[,k]])
             data$MS[j] <- data$MS[j] + ms_points[value[j]];
             data$PA[j] <- data$PA[j] + 1;
    
           if (value[j] < 11)
           {
             data$R10[j] <- data$R10[j] + 1
           }
           if (value[j] == 1)
           {
             data$R1[j] <- data$R1[j] + 1;
           }
           if (value[j] == 2)
           {
             data$R2[j] <- data$R2[j] + 1;
           }
           if (value[j] == 3)
           {
             data$R3[j] <- data$R3[j] + 1;
           }
           }
         }
       }
       
     }
for (i in 1:199)
{
  data$TO[i] <- data$IN[i] + data$SP[i] + data$PU[i] + data$MS[i];
}
#library(xlsx)
data <- data[order(-data$TO),]
data$X <- c(1:199)
write.csv(data, "C:/Users/DNS1/Documents/RStudio/course/2013-2014_edit.csv")
  
  
  




