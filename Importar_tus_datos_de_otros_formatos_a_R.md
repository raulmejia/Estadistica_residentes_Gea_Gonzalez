# ¿Cómo puedo importar mis datos .xlsx o .sav a R?
### Importar datos de SPSS

```install.packages("foreign") ```  
```library(foreign)```  
```data <- read.spss("C:/PathToFile/dataset.sav", to.data.frame=TRUE)```  

### Importar datos de excel  
Ejemplo 1: leer la primer hoja de cálculo de myexcel.xlsx , donde el primer renglón contiene el nombre de las variables.  
```library(xlsx)```  
```mydata <- read.xlsx("c:/myexcel.xlsx", 1)```  

Ejemplo 2: # leer la  "worksheet" llamada mysheet.  
```library("xlsx")```
```mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet")```

## References :
1. https://www.statmethods.net/input/importingdata.html
2. http://www.sthda.com/english/wiki/reading-data-from-excel-files-xls-xlsx-into-r
3. http://www.sthda.com/english/wiki/r-xlsx-package-a-quick-start-guide-to-manipulate-excel-files-in-r
