# install.packages("dplyr") # Instalar una librería que facilitará la manipulación de data.frames, la usaremos al final de ésta práctica
# install.packages("dprep")
# library(dprep)

library(dplyr) # Cargamos la librería instaladad en el comando anterior

# Función "moda" que necesitaremos más adelante
moda <- function(x) {
  t <- table(x)
  return(as.numeric(names(t)[t == max(t)]))
  
}

#---

m1 <- matrix(1:16,ncol=4)
colnames( m1 ) <- LETTERS[5:8]
rownames( m1 ) <- LETTERS[9:12]
m1

  # Extraer datos
# Extraer el 11
# Extraer los datos de la columna "G"
# Extraer los datos del primer renglón

mydf <- data.frame(c("Ale","Beto","Carla","Daniela"), 1:4 , LETTERS[ 1:4 ] , rep(FALSE,4))
colnames( mydf ) <- LETTERS[10:13]
rownames( mydf ) <- c("Ein","Renglón 2","El 3","Vier")
mydf

# Extraer los nombres de la primer columna
# ¿Cómo extraer el número 3? 
# Extraer los nombres de los renglones



############################
# --- Lectura de datos --- #
############################

BC_Perou <- read.table(file = "/media/rmejia/ADATA-HD710/boba-bk-postsismo/rmejia/Documents/Otros_Proyectos_academicos/Clases_estadistica_residentes_GEA_GONZALEZ/Practicas/Practica2/Data/BC_CharlesPerou_selected_cols.tsv",sep="\t",header=TRUE,stringsAsFactors = FALSE)
# Ojo: debes escribir la ruta de TU archivo en TU computadora, la dirección anterior file = "/media/..." correspondío a la ruta de mi archivo en mi computadora. 
# Nota:  Para los usuarios de Windows: Ojo a veces windows usa las diagonales invertidas "\" por ejemplo "\tu\ruta" en lugar de "/tu/ruta" 

# --- exploración inicial
dim(BC_Perou)
head(BC_Perou)
str(BC_Perou)
head(BC_Perou)

# Construyamos nuestra variable aleatoria y función de probabilidad  a partir de este ejemplo
table( BC_Perou[ , "AJCC.Stage" ] )

sum(table( BC_Perou[ , "AJCC.Stage" ] ))
 
myvec <- as.numeric(table( BC_Perou[ , "AJCC.Stage" ] ))
myvec <- (myvec / 791)
plot(1:13, myvec , type = "l")

# paste0(rep("Stage",5),1:5)
table( BC_Perou[ , "AJCC.Stage" ] )
# Espacio muestral
MyVA <- c( (12 + 10) , (58+64+11) , (40+249+157) , (18 + 102 +23  +32) , 15 )
# Variable aleatoria
names(MyVA) <- 0:4
MyVA ; sum(MyVA)

# Función de probabilidad
MyProb <- (MyVA / sum(MyVA))
MyProb
plot(0:4,  MyVA )


#--- Medidas de tendencia central y dispersiòn 

NoNas <- !is.na(BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"])
AgeAtDiagnosis <- BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"][NoNas]
boxplot(BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"] )

# Dispersión 
sd(AgeAtDiagnosis)
var(AgeAtDiagnosis)
sqrt(var(AgeAtDiagnosis))

# Medidas de tendencia central
mean(AgeAtDiagnosis)
median(AgeAtDiagnosis)
moda(AgeAtDiagnosis)

# Cuartiles , percentiles
min( BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"] , na.rm = TRUE)  
max(BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"] , na.rm = TRUE)
quantile(AgeAtDiagnosis , .25 )
quantile(AgeAtDiagnosis , .75 )
quantile(AgeAtDiagnosis , .80 )

# diferencias en las distribuciones
par(mfrow=c(1,2))
boxplot(BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"] )
boxplot(BC_Perou[ , "OS.Time"] )

par(mfrow=c(1,1))

no_nas<- !is.na(BC_Perou[ , "OS.Time"])
OS_time <- BC_Perou[ , "OS.Time"][no_nas]
hist( OS_time )
hist( OS_time , breaks = 10)
hist( OS_time , breaks = 100)
hist( OS_time , breaks = 1000)
hist( OS_time , breaks = 100 , xlab = "Overal_survival" , ylab = "fecuencia" , col = "pink")
hist( OS_time , breaks = 100 , xlab = "Overal_survival" , ylab = "fecuencia" , main = "Supervicencia")
hist( OS_time , breaks = 1000 , xlab = "Overal_survival" , ylab = "fecuencia" , main = "Supervicencia",
      xlim = c(365,365*2))



