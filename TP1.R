2+3
x <- exp(2)
x
pi
cos(pi/4)

######### creating vector ############

v <- c(1,2,3,4)
s <- mode(v)
length(v)


######### scanning keyboard ############

scan()
a<- scan()
b<-scan()
c<- a + b
print(c)
c


######### Condition ############
if (b < c){
  
 print("salam")
  
}else{
  print("bslama")
}

######### functions ############
carre <- function(x) { return (x*x) }
cube = function(x) { return (x*x*x)}
carre(3)
cube(2)


######### vecteurs ############

#note : en R tt est un vecteur

#creates a vector of 10 ZEROS
v1 <- vector("numeric", 10)

#Creates a vector of 10 values FALSE
v2 <- vector("logical" , 8)

#Creates a vector of the given values
v3 <- c(1,2,4,8)

#Creates a vector of 10 repetitive values of 1
v4 <- rep(1,10)

#Creates a sequence from 1 to 10
V5 <- seq(1,10)

#Creates a sequence from 1 to 10
v6 <- (1:10)

#Creates a sequence from 1 to 10 with steps of 3
v7 <- seq(1,10,3)


#Naming vector elements

poids <- c(77, 58, 66, 82)
poids
names(poids)
names(poids) <- c("lwl", "tani", "talt", "rabae")
poids
poids["tani"]

#extrait de vecteur
poids[2:3]

poids[c(1,4)]
poids[c(TRUE,FALSE,TRUE,FALSE)]



v <- c(1:12, 8:5, rep(2,4), 8:15, 16:12)
v

#exercise
#select elements of V that are greater than 7
s <- v[v > 7]

#######" operations on vectors ########


poids <- c(85,78,54,98,66,78,77,72,99,102,54,66,98,75,82,83,75)
poids

#Add 1 to all elements of vector
poids <- poids +1
poids
#Square root all elements of vector
sqrt(poids)

length(poids)

#takes elements from 2 to 17
poids <- poids[2:length(poids)]
poids
length(poids)
sort(poids)
sort(poids, decreasing= TRUE)

#gives the index of elements in sorting order
order(poids)
#sorts the array
poids[order(poids)]


summary(poids)

############## Compare multiple vectors ##########

objets <- load("test.RData")
objets

length(tailleG)
length(performanceG)
length(tailleF)
length(performanceF)
names(tailleG)
names(performanceG)
names(tailleF)
names(performanceF)
union(names(tailleG),names(performanceG))




