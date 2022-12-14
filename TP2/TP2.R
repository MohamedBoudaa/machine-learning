#ce que peut etre demandé le jour de l'examen
# pour ce réseau de neauronnes combien de poids à ajuster



library(neuralnet) # to install run :install.packages('neuralnet')
#exercice 1
train.input <- as.data.frame(runif(50, min = 0 , max = 100))
train.output <- sqrt(train.input)
data.train <- cbind(train.input , train.output)
colnames(data.train) <- c("Input","Output")
data.train
net.sqrt <- neuralnet(Output ~ Input , data = data.train, hidden = 10)
?neuralnet
net.sqrt$result.matrix
net.sqrt$result.matrix[1,1]
plot(net.sqrt) ## un exercice de type examen il faut calculer la matrix et mesurer l'erreur et de l'afficher


data.test <- as.data.frame((1:10)^2) #generate test data
data.test
?compute
prediction <- compute(net.sqrt , data.test)
prediction$net.result
prediction$neurons
table <- cbind(data.test, sqrt(data.test), as.data.frame(prediction$net.result))
colnames(table) <- c("Entrée", "Sortie attendue" , "Réseau de neurones prédiction")
table





#Exercice 2

#summary : senthèse sur les données

#charger la base iris
iris <- read.csv("iris.csv" , header = T)
summary(iris)
head(iris)
str(iris)
table(iris$Species)
#mélanger l'ordre des lignes
v <- round(runif(150 , min = 0 , max = 1), digits = 2)
iris <- iris[order(v),]
head(iris)
#normaliser les colonnes [2,5]

normalize <- function(v){
  max <- max(v)
  min <- min(v)
  v <- (v - min) / (max - min)
  return(v)
}

irisN <- as.data.frame(lapply(iris[,c(2:5)], normalize))

#remettre la dernière colonne

irisN <- cbind(irisN, iris$Species)
colnames(irisN) <- c("SepalLength", "SepalWidth" , "PetalLength" , "PetalWidth" , "Species")
head(irisN)

#extraire 105 observations pour l'ensemble d'apprentissage et 45 observations pour l'ensemble de test

v <- sample(1:150 , 0.7 * nrow(irisN))
v
iris.app <- irisN[v,]
iris.test <- irisN[-v,]

# ajouter 3 nouvelles colonnes "setosa , virginica , versicolor" de type booléan
iris.app$setosa <- iris.app$Species == "Iris-setosa"
iris.app$virginica <- iris.app$Species == "Iris-virginica"
iris.app$versicolor <- iris.app$Species == "Iris-versicolor"
#supprimer la colonne "Species"
iris.app$Species <- NULL
head(iris.app)
#construire le réseau de neurones
net.iris <- neuralnet(setosa + versicolor + virginica ~ SepalLength + SepalWidth + PetalLength + PetalWidth,
                      data = iris.app , hidden = 3)
?neuralnet
plot(net.iris)
#effectuer la prédiction sur l'ensemble de test

prediction <- compute(net.iris , iris.test[,-5])
prediction
colnames(prediction$net.result) <- c("Iris-setosa","Iris-versicolor","Iris-virginica")
prediction$net.result
prediction$neurons

#récupérer les labels à partir des valeurs prédites par le réseau de neurones
names(which.max(prediction$net.result[1,]))
labels.predicted <- rep(0,45)

for(i in 1:45)
  labels.predicted[i] <- names(which.max(prediction$net.result[i,]))

labels.predicted

#comparer les étiquettes prédites et les étiquettes réelles dans iris.test
#afficher la matrice de confusion

table(iris.test[,5], as.factor(labels.predicted))






