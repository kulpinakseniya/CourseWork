setwd('/Users/DNS1/Documents/Rstudio/course')

data10 = read.csv("10-11_n.csv", sep = ",")
data11 = read.csv("11-12_n.csv", sep = ",")
data12 = read.csv("12-13_n.csv", sep = ",")
data13 = read.csv("13-14_n.csv", sep = ",")

data10$count <- 1
data11$count <- 1
data12$count <- 1
data13$count <- 1

total <- merge(data10, data11, by = c("Family.Name","Given.Name","Nation"), all = TRUE)

total$X.x = NULL
total$X.1.x = NULL
total$X.y = NULL
total$X.1.y = NULL

total[is.na(total)] <- 0

total <- merge(total, data12, by = c("Family.Name","Given.Name","Nation"), all = TRUE)
total[is.na(total)] <- 0

total$X.1 = NULL
total$X = NULL

total$TO <- total$TO.x + total$TO.y + total$TO
total$TO.x = NULL
total$TO.y = NULL
total$IN <- total$IN.x + total$IN.y + total$IN
total$IN.x = NULL
total$IN.y = NULL
total$SP <- total$SP.x + total$SP.y + total$SP
total$SP.x = NULL
total$SP.y = NULL
total$PU <- total$PU.x + total$PU.y + total$PU
total$PU.x = NULL
total$PU.y = NULL
total$MS <- total$MS.x + total$MS.y + total$MS
total$MS.x = NULL
total$MS.y = NULL

names(total)[names(total) == "T..."] <- "T"
names(total)[names(total) == "P..."] <- "P"
names(total)[names(total) == "S..."] <- "S"
             
total$T <- total$T....x + total$T....y + total$T
total$T....x = NULL
total$T....y = NULL
total$P <- total$P....x + total$P....y + total$P
total$P....x = NULL
total$P....y = NULL
total$S <- total$S....x + total$S....y + total$S
total$S....x = NULL
total$S....y = NULL

total$count <- total$count.x + total$count.y + total$count
total$count.x = NULL
total$count.y = NULL

total$R <- total$R.x + total$R.y + total$R
total$R.x = NULL
total$R.y = NULL
total$R1 <- total$R1.x + total$R1.y + total$R1
total$R1.x = NULL
total$R1.y = NULL
total$R2 <- total$R2.x + total$R2.y + total$R2
total$R2.x = NULL
total$R2.y = NULL
total$R3 <- total$R3.x + total$R3.y + total$R3
total$R3.x = NULL
total$R3.y = NULL
total$R10 <- total$R10.x + total$R10.y + total$R10
total$R10.x = NULL
total$R10.y = NULL
total$PA <- total$PA.x + total$PA.y + total$PA
total$PA.x = NULL
total$PA.y = NULL

total <- merge(total, data13, by = c("Family.Name","Given.Name","Nation"), all = TRUE)
total[is.na(total)] <- 0

total$X.1 = NULL
total$X = NULL

names(total)[names(total) == "TO.x"] <- "TO"
names(total)[names(total) == "IN.x"] <- "IN"
names(total)[names(total) == "SP.x"] <- "SP"
names(total)[names(total) == "PU.x"] <- "PU"
names(total)[names(total) == "MS.x"] <- "MS"


total$TO <- total$TO + total$TO.y
total$TO.y = NULL
total$IN <- total$IN + total$IN.y
total$IN.y = NULL
total$SP <- total$SP + total$SP.y
total$SP.y = NULL
total$PU <- total$PU + total$PU.y
total$PU.y = NULL
total$MS <- total$MS + total$MS.y
total$MS.y = NULL

names(total)[names(total) == "R.x"] <- "R"
names(total)[names(total) == "R1.x"] <- "R1"
names(total)[names(total) == "R2.x"] <- "R2"
names(total)[names(total) == "R3.x"] <- "R3"
names(total)[names(total) == "R10.x"] <- "R10"
names(total)[names(total) == "PA.x"] <- "PA"

total$R <- total$R.y + total$R
total$R.y = NULL
total$R1 <- total$R1.y + total$R1
total$R1.y = NULL
total$R2 <- total$R2.y + total$R2
total$R2.y = NULL
total$R3 <- total$R3.y + total$R3
total$R3.y = NULL
total$R10 <- total$R10.y + total$R10
total$R10.y = NULL
total$PA <- total$PA.y + total$PA
total$PA.y = NULL

total$T <- total$T... + total$T
total$T... = NULL
total$P <- total$P... + total$P
total$P... = NULL
total$S <- total$S... + total$S
total$S... = NULL

total$count <- total$count.x + total$count.y
total$count.x = NULL
total$count.y = NULL

total$TO <- round(total$TO/total$count*100, digits = 3)
total$IN <- round(total$IN/total$count*100, digits = 3)
total$SP <- round(total$SP/total$count*100, digits = 3)
total$PU <- round(total$PU/total$count*100, digits = 3)
total$MS <- round(total$MS/total$count*100, digits = 3)
total$T <- round(total$T/total$count, digits = 3)
total$P <- round(total$P/total$count, digits = 3)
total$S <- round(total$S/total$count, digits = 3)
total$R <- round(total$R/total$count, digits = 3)
total$R1 <- round(total$R1/total$count, digits = 3)
total$R2 <- round(total$R2/total$count, digits = 3)
total$R3 <- round(total$R3/total$count, digits = 3)
total$R10 <- round(total$R10/total$count, digits = 3)
total$PA <- round(total$PA/total$count, digits = 3)

total <- total[order(-total$TO),]
total$X <- c(1:234)
total <- total[, c(19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)]
write.csv(total, "C:/Users/DNS1/Documents/RStudio/course/total.csv")
