normalize <- function(x) {
  y <- x/max(x)
  y
}

setwd('/Users/DNS1/Documents/Rstudio/course')
normdata = read.csv("13-14_n.csv", sep = ",")
summary(normdata)

normdata$TO <- round(normalize(normdata$TO), digits = 3)
normdata$IN <- round(normalize(normdata$IN), digits = 3)
normdata$SP <- round(normalize(normdata$SP), digits = 3)
normdata$PU <- round(normalize(normdata$PU), digits = 3)
normdata$MS <- round(normalize(normdata$MS), digits = 3)
normdata$R1 <- round(normdata$R1/normdata$R, digits = 3)*100
normdata$R2 <- round(normdata$R2/normdata$R, digits = 3)*100
normdata$R3 <- round(normdata$R3/normdata$R, digits = 3)*100
normdata$R10 <- round(normdata$R10/normdata$R, digits = 3)*100
normdata$PA <- round(normdata$PA/normdata$R, digits = 3)*100
write.csv(normdata, "C:/Users/DNS1/Documents/RStudio/course/13-14_n.csv")
