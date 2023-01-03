data <- read.csv ( "iris.csv" , header=TRUE)
head (data)
summary(data)
str(data)
dim(data)

str(target)
typeof(target)

table(data$Species)

v <- round(runif(150 , min = 0 , max = 1), digits = 2)

dataR <- data[order(v),]
head(dataR)

target = dataR['Species']

#normaliser les colonnes [2,5]

normalize <- function(v){
  max <- max(v)
  min <- min(v)
  v <- (v - min) / (max - min)
  return(v)
}


dataN <- as.data.frame(lapply(dataR[,c(2:5)], normalize))
head(dataN)

dataTrain <- dataN [ c (1:100) , ]
dataTest <- dataN[c(101:150), ]
labelTrain <- target[c(1:100), ]

library(class)
model <- knn(train = dataTrain , test = dataTest, cl = labelTrain ,k=3);
target[c(101:150),]
conf <- table(model,target[c(101:150),])
conf


