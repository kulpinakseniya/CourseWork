normalize <- function(x) {
  y <- (x - min(x))/(max(x) - min(x))
  y
}

#setwd('/Users/DNS1/Documents/Rstudio/сourse')
data = read.csv("total.csv", sep = ",")

data$Family.Name = NULL
data$X = NULL
data$Given.Name = NULL
data$Nation = NULL

N  <-  nrow(data)

target <- data$OG
data <- as.data.frame(lapply(data[,1:ncol(data)-1], normalize))
ncol(data)

data.train <- data[,1:ncol(data)-1]
data.test <- data[,1:ncol(data)-1]
target.train  <- target
target.test <- target

library(class)

target.predict  <- knn(data.train, data.test, target.train, k = 3)
table(target.predict, target.test)

target.predict  <- knn(data.train, data.test, target.train, k = 5)
table(target.predict, target.test)

target.predict  <- knn(data.train, data.test, target.train, k = 7)
table(target.predict, target.test)

library("matlab")
N <- nrow(data)
cross.table <- zeros(2)

for (i in 1:N)
{
  cross.target <- target[-i]
  cross.data <- data[-i,]
  pred.knn <- knn(cross.data, data[i,], cross.target, k = 7)
  if (pred.knn == target[i] & pred.knn == 'YES'){ 
    cross.table[1,1] <- cross.table[1,1] + 1 
  } else if (pred.knn == 'YES' & target[i] == 'NO'){
    cross.table[1,2] <- cross.table[1,2] + 1 
  } else if (pred.knn == target[i] & pred.knn == 'NO'){ 
    cross.table[2,2] <- cross.table[2,2] + 1 
  } else { cross.table[2,1] <- cross.table[2,1] + 1}
  
}

print(cross.table)
