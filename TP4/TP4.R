library(rpart)
# Load the tennis.csv dataset
data.tennis <- read.csv("tennis.csv")
# Build the decision tree using the rpart function
# The rpart function takes in the following arguments:
# - The formula specifying the target class (Jouer) and the attributes to use for prediction (Ciel, Temperature, Humidite, Vent)
# - The data frame containing the training data (data.tennis)
# It returns the decision tree model (tree.tennis)
tree.tennis <- rpart(Jouer ~ Ciel + Temperature + Humidite + Vent, data = data.tennis)

# Modify the minsplit parameter and rebuild the decision tree
# The rpart.control function allows us to specify additional control parameters for building the decision tree
# We set the minsplit parameter to 1
# The modified control parameters are stored in the object tennis.cnt
tennis.cnt <- rpart.control(minsplit = 1)

# We use the modified control parameters when rebuilding the decision tree
tree.tennis <- rpart(Jouer ~ Ciel + Temperature + Humidite + Vent, data = data.tennis, control = tennis.cnt)

# Visualize the decision tree using various plot and text commands
# The plot function generates a graphical representation of the decision tree
plot(tree.tennis)

# The text function adds labels to the decision tree plot, showing the attribute and decision at each node
text(tree.tennis)

# The plot function can be called with different arguments to customize the appearance of the plot
# Setting uniform = TRUE makes the branches of the tree equally sized
plot(tree.tennis, uniform = TRUE)

# Setting use.n = TRUE and all = TRUE adds the count and percentage of observations at each node
text(tree.tennis, use.n = TRUE, all = TRUE)

# Setting branch = 0 only plots the decision tree down to the root node
plot(tree.tennis, branch = 0)

# Setting branch = 0.7 only plots the decision tree down to the nodes with complexity less than or equal to 0.7
plot(tree.tennis, branch = 0.7)

# Setting use.n = TRUE adds the count and percentage of observations at each node
text(tree.tennis, use.n = TRUE)

# The plot function can be called with different arguments to customize the appearance of the plot
# Setting branch = 0.4 only plots the decision tree down to the nodes with complexity less than or equal to 0.4
# Setting uniform = TRUE makes the branches of the tree equally sized
# Setting compress = TRUE removes branches with only one child
plot(tree.tennis, branch = 0.4, uniform = TRUE, compress = TRUE)

#--------------------------------------------------------------------------#
#utilisation d'une autre lib pour afficher plus rapidement
install.packages("rpart.plot")
library(rpart.plot)
data.tennis <- read.csv("tennis.csv")
tree.tennis <- rpart(Jouer ~ Ciel + Temperature + Humidite + Vent, data = data.tennis)
tennis.cnt <- rpart.control(minsplit = 1)
tree.tennis <- rpart(Jouer ~ Ciel + Temperature + Humidite + Vent, data = data.tennis, control = tennis.cnt)
prp(tree.tennis)
str(data.tennis)

#--------------------------------------------------------------------------#


###################################################
#correction prof
####################################################


data.test <- read.csv("tennis_test.csv")
data.test
predict(tree.tennis, data.test , "class")

table(predict(tree.tennis, data.tennis, "class"), data.tennis$Jouer)

tennis.cnt <- rpart.control(minsplit = 5)
tree.tennis <- rpart (Jouer ~ Ciel + Temperature + Humidite + Vent, data.tennis, control =tennis.cnt)
tree.tennis
plot(tree.tennis)
text(tree.tennis)
table(predict(tree.tennis, data.tennis,"class"),data.tennis$Jouer)

##################
#exercice 2 - gpt#
##################

# Load the car.test.frame dataset
data("car.test.frame")

# Store the dataset in a data frame called data.cars
data.cars <- car.test.frame

# Display the first few rows of the data frame
head(data.cars)

# Display the number of observations in the data frame
nrow(data.cars)

# Display the data type of each attribute
str(data.cars)

# Display the characteristics of the Nissan Maxima V6
data.cars[data.cars$Type == "Nissan Maxima V6", ]

# Determine the number of classes for the target attribute (Type)
length(unique(data.cars$Type))

# Build a vector of the counts for each type of car
car.counts <- table(data.cars$Type)

# Visualize the counts using a bar plot
barplot(car.counts)

# Visualize the relationship between the Weight and Disp attributes
plot(data.cars$Weight, data.cars$Disp)

# Build a decision tree to predict the Type attribute based on the other attributes
tree.cars <- rpart(Type ~ ., data = data.cars, minsplit = 1)

# Prune the decision tree using the prune function
tree.cars.pruned <- prune(tree.cars, cp = 0.1)

# View the pruned decision tree
tree.cars.pruned

# Increase the value of the cp parameter to prune the tree further
tree.cars.pruned <- prune(tree.cars, cp = 0.2)
tree.cars.pruned <- prune(tree.cars, cp = 0.3)
tree.cars.pruned <- prune(tree.cars, cp = 0.4)
tree.cars.pruned <- prune(tree.cars, cp = 0.5)
tree.cars.pruned <- prune(tree.cars, cp = 0.6)
tree.cars.pruned <- prune(tree.cars, cp = 0.7)
tree.cars.pruned <- prune(tree.cars, cp = 0.8)
tree.cars.pruned <- prune(tree.cars, cp = 0.9)

# Display the cp table for the decision tree
tree.cars$cptable

# Determine the number of pruned trees in the cp table
nrow(tree.cars$cptable)

# Plot the error rate for each pruned tree
plot(tree.cars$cptable[, "xerror"], tree.cars$cptable[, "xstd"])

# Determine the pruned tree with the lowest error rate
tree.cars.optimal <- prune(tree.cars, cp = tree.cars$cptable[which.min(tree.cars$cptable[, "xerror"]), "CP"])

# Visualize the optimal pruned tree
plot(tree.cars.optimal)
text(tree.cars.optimal)

# Generate predictions for the training data using the optimal pruned tree
predictions <- predict(tree.cars.optimal, data.cars, type = "class")

# Determine the accuracy of the predictions
mean(predictions == data.cars$Type)




######################################################

# 1. Load the car.test.frame data set
data(car.test.frame)

# 2. Create a new data frame called data.cars from the car.test.frame data set
data.cars <- car.test.frame

# 3. Display the first few rows of the data.cars data frame
head(data.cars)

# 4. Display the number of observations in the data.cars data frame
nrow(data.cars)

# 5. Display the data type of each variable in the data.cars data frame
str(data.cars)

# 6. Display the characteristics of the Nissan Maxima V6
data.cars[data.cars$Name == "Nissan Maxima V6", ]

# 7. Display the number of classes in the Type variable
length(unique(data.cars$Type))

# 8. Create a vector of counts for each car type
counts <- table(data.cars$Type)

# 9. Create a bar plot of the counts vector
barplot(counts)



plot(data.cars$Weight, data.cars$Disp)

tree.control <- rpart.control(minsplit = 1)
tree.cars <- rpart(Type ~ ., data = data.cars, control = tree.control)











