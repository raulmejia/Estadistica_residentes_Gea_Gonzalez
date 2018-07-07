install.packages("dplyr") # Instalar una librería que facilitará la manipulación de data.frames, la usaremos al final de ésta práctica
library(dplyr) # Cargamos la librería instaladad en el comando anterior

##################
# -- vectores -- #
##################

a <- c( 1,2,3,4)
a
b <- 1:4
b
names( a) <- LETTERS[ 1:4 ]
a
a == b
mode( a)
a[2] <- -20
a["C"] <- -0.3 
is.vector(a)
as.character(a) + 2 # No podemos sumar "character" on "numeric"
a +2


##################
# -- matrices -- #
##################

m1 <- matrix(1:16,ncol=4)
m1
dim(m1) 

  # ejercicio ordenar por renglones
?matrix

colnames( m1 ) <- LETTERS[5:8]
m1
rownames( m1 ) <- LETTERS[9:13]
attributes(m1)  
 
  # Extraer datos
    # Posición
m1[2]
m1[ 2 , 3 ]
    # Nombre de columna / renglón
m1[ 1 , "G"]
m1[  , "G"]
m1[ 2 , ]
 

###################
# - data.frames - #
###################

mydf <- data.frame( 1:4 , LETTERS[ 1:4 ] , rep(FALSE,4))
mydf
colnames( mydf ) <- LETTERS[10:12]
dim( mydf ) ; class( mydf )
str(mydf)
mydf$L

# ! cuidado con los factors

################
# -- listas -- #
################

milista <- list( a, mydf , m1 , "hola")
names(milista) <- letters[20:23]
milista[["v"]]
milista$w

############################
# --- Lectura de datos --- #
############################

clinical<-read.table(file = "/la/ruta/de/tu/computadora/donde/esta/tu/archivo/dataSubt.tsv",sep="\t",header=TRUE,stringsAsFactors = FALSE)
# Por ejemplo en mi computadora (Sistema Operativo GNU/Linux) es file= "/media/rmejia/ADATA-HD710/boba-bk-postsismo/rmejia/Documents/Otros_Proyectos_academicos/Clases_estadistica_residentes_GEA_GONZALEZ/Practicas/Practica1/dataSubt.tsv" 
# Nota:  Para los usuarios de Windows: Ojo a veces windows usa las diagonales invertidas "\" por ejemplo "\tu\ruta" en lugar de "/tu/ruta" 

# --- exploración inicial
dim(clinical)
head(clinical)
str(clinical)
head(clinical)
clinical[ 1:3 , 1:5 ]

BC_Perou <- clinical[,c(1,2,3,4,5,6,7,9,11,13,16,20,21)] # Extraemos columnas selccionadas
head( BC_Perou )
write.table( BC_Perou ,file="/la/ruta/dont/quieras/guardar/tu/archivo/El_nombre_que_quieras.tsv",col.names = TRUE, row.names = FALSE, sep="\t") # we get our first table
# Con el comando anterior guardamos le objeto

hombres <- BC_Perou[ , "Gender"] == "MALE"
sum( hombres )
Num_hombres<- sum( hombres , na.rm = TRUE)

dim( BC_Perou )
Num_hombres / 813

table( BC_Perou[ , "AJCC.Stage" ] )

boxplot(BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"] )
min( BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"] , na.rm = TRUE)  
max(BC_Perou[ , "Age.at.Initial.Pathologic.Diagnosis"] , na.rm = TRUE)

boxplot(BC_Perou[ , "OS.Time"] )
no_nas<- !is.na(BC_Perou[ , "OS.Time"])
OS_time <- BC_Perou[ , "OS.Time"][no_nas]
plot( )
hist( OS_time )
hist( OS_time , breaks = 10)
hist( OS_time , breaks = 100)
hist( OS_time , breaks = 1000)
hist( OS_time , breaks = 100 , xlab = "Overal_survival" , ylab = "fecuencia" , col = "pink")
hist( OS_time , breaks = 100 , xlab = "Overal_survival" , ylab = "fecuencia" , main = "Supervicencia")
hist( OS_time , breaks = 1000 , xlab = "Overal_survival" , ylab = "fecuencia" , main = "Supervicencia",
      xlim = c(365,365*2))

# -- dplyr package!

BC_Perou %>% filter( Tumor == "T2")  # filtramos el data set por aquellos renglones(pacientes) que cumplan Tumor == "T2"
BC_Perou_T2 <- BC_Perou %>% filter( Tumor == "T2") # Guardamos lo anterior
head( BC_Perou_T2 ) # Exploramos ese nuevo filtrado
BC_Perou %>% filter( Tumor == "T2") %>% head() # Comando equivalente al comando anterior

BC_Perou %>% filter( Tumor == "T2") %>% filter( AJCC.Stage == "Stage IIA") %>% head()  # Doble filtrado, pacintes Tumor == "T2" y el TNM i.e. AJCC.Stage == "Stage IIA"
BC_Perou %>% filter( Tumor == "T2") %>% filter( AJCC.Stage == "Stage IIA") %>% 
  filter( Vital.Status == "LIVING") # Triple filtro, OJO estamos usando el paquete dplyr para hacer más facil los filtrados por eso lo instalamos

BC_Perou %>% filter( Tumor == "T2") %>% filter( AJCC.Stage == "Stage IIA") %>% 
  filter( Vital.Status == "LIVING") %>% select(patient) # Tres filtrados y al final seleccionamos sólo la columna que contiene el nombre/identificador de los pacientes

BC_Perou %>% filter( PAM50.mRNA == "Basal-like") %>% filter( AJCC.Stage == "Stage IIA") %>% 
  filter( Vital.Status == "LIVING") %>% select(patient)

# Más ejercicios de select y filter

select( BC_Perou , c("Gender", "patient") ) %>% head()

select( BC_Perou , c("Gender", "patient") ) %>% filter(Gender == "MALE")  %>% head()

filter( BC_Perou , Tumor == "T2") %>% select( c("Gender", "patient", "AJCC.Stage" , "PAM50.mRNA") )

filter( BC_Perou , Tumor == "T2") %>% filter( Metastasis == "M1")





# Origen de los datos
# cite = https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3465532/
# The Cancer Genome Atlas Network
# Charles M Perou, Comprehensive molecular portraits of human breast tumors, Nature, 2012. PMID: 23000897


