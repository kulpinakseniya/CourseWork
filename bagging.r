library(adabag)
library(rpart)
library(caret)

setwd('/Users/DNS1/Documents/Rstudio/course')

mydata = read.csv("total.csv", sep = ",")
mydata$Family.Name = NULL
mydata$Given.Name = NULL
mydata$X = NULL
mydata$count = NULL
mydata$T = NULL
mydata$Nation = NULL
mydata$R = NULL


#train <- sample(1:100)

data.bagging <- bagging (OG ~ ., data = mydata, mfinal = 400, control = rpart.control(maxdepth = 3))
#data.bagging$class

table(data.bagging$class, mydata$OG, dnn = c("Predicted Class", "Observed Class"))

data.predbagging <- predict.bagging (data.bagging, newdata = mydata)
data.predbagging

barplot(data.bagging$imp[order(data.bagging$imp, decreasing = TRUE)],
        ylim = c(0, 100), main = "Variables Relative Importance", col = rainbow(12))
