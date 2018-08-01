# Calcular probabilidades binomiales con dbinom

# La suma de las probabilidades de la distribución binomial (y cualquier otra distribución de probabilidad) debe dar 1.
dbinom(4, size=4, prob=0.2) +
dbinom(3, size=4, prob=0.2) +
dbinom(2, size=4, prob=0.2) +
dbinom(1, size=4, prob=0.2) +
dbinom(0, size=4, prob=0.2) 


# El promedio de la distribución binomial debe ser (teoricamente) igual a n * p
mu = 4 * 0.2 
mu

# Hagamos el cálculo para nuestro ejemplo
4 *  dbinom(4, size=4, prob=0.2) +
3 *  dbinom(3, size=4, prob=0.2) +
2 *  dbinom(2, size=4, prob=0.2) +
1 *  dbinom(1, size=4, prob=0.2) +
0 *  dbinom(0, size=4, prob=0.2) 

# varianza = n * p * (1 -p)

4 * 0.2 * 0.8

(
( dbinom(4, size=4, prob=0.2) - 0.8 )**2 +
( dbinom(3, size=4, prob=0.2) - 0.8 )**2 +
( dbinom(2, size=4, prob=0.2) - 0.8 )**2 +
( dbinom(1, size=4, prob=0.2) - 0.8 )**2 +
( dbinom(0, size=4, prob=0.2) - 0.8 )**2
)/5



# Ejercicio ¿Probabilidad de no detectar a un paciente con una prueba de sensibilidad = .7 en 
# dos ocasiones?

dbinom( , size = , prob = )

# Create a sample of 50 numbers which are incremented by 1.
x <- seq(0,50,by = 1)
x

# Create the binomial distribution.
y <- dbinom(x,50,0.5)
y
50*.5

# Plot the graph for this sample.
plot(x,y)

y1 <- dbinom(x,50,0.3)
plot(x,y)

par(mfrow=c(2,1))
plot(x,y)
plot(x,y1)
par(mfrow=c(1,1))

par(mfrow=c(2,1))
y2 <- pbinom(x,50,0.5)
plot(x,y2)
y3 <- pbinom(x,50,0.3)
plot(x,y3)
par(mfrow=c(1,1))

# pbinom()

# This function gives the cumulative probability of an event. 
# It is a single value representing the probability.

# Probability of getting 26 or less heads from a 51 tosses of a coin.
x <- pbinom(26,51,0.5)
print(x)


# --- qbinom()
#This function takes the probability value and gives a
# number whose cumulative value matches the probability value.

# How many heads will have a probability of 0.25 will come out when a coin
# is tossed 51 times.
x <- qbinom(0.25,51,1/2)
print(x)

# --- rbinom
# This function generates required number of random values of given probability 
#from a given sample.

# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8,150,.4)
print(x)


1 - dbinom( 0 , size = 5 , prob = 0.05)
#######################
# Distribución normal #
#######################


pnorm( 2 , lower.tail = FALSE)
pnorm( -2 , lower.tail = TRUE) 
pnorm( 2 , lower.tail = FALSE) # Por simetria será igual de lado derecho que de lado izquierdo
1 - 2* pnorm( 2 , lower.tail = FALSE)
pnorm( 0 , lower.tail = TRUE) - pnorm( 1.73 , lower.tail = FALSE)


# Ejercicio 2
# z = (y - mu)/sigma
z1 = (80 - 75)/10
z2 = (90 - 75)/10
pnorm( z2, lower.tail = TRUE) - pnorm( z1, lower.tail = TRUE)

set.seed(3000)
xseq<-seq(-4,4,.01)
densities<-dnorm(xseq, 0,1)
cumulative<-pnorm(xseq, 0, 1)
randomdeviates<-rnorm(1000,0,1)

par(mfrow=c(1,3), mar=c(3,4,4,2))

plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)

plot(xseq, cumulative, col="darkorange", xlab="", ylab="Cumulative Probability",type="l",lwd=2, cex=2, main="CDF of Standard Normal", cex.axis=.8)

hist(randomdeviates, main="Random draws from Std Normal", cex.axis=.8, xlim=c(-4,4))







