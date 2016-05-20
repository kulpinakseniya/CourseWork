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

#train <- sample(1:110)

data.adaboost <- boosting (OG ~ ., data = mydata, mfinal = 200, control = rpart.control(maxdepth = 2))
data.adaboost$class
data.adaboost$importance

table(data.adaboost$class, mydata$OG, dnn = c("Predicted Class", "Observed Class"))

data.predboosting <- predict.boosting(data.adaboost, newdata = mydata)
data.predboosting

barplot(data.adaboost$imp[order(data.adaboost$imp, decreasing = TRUE)],
        ylim = c(0, 100), main = "Variables Relative Importance", col = rainbow(12))

