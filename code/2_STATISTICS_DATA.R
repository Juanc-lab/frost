

library(tidyverse)
library(dplyr)

setwd("C:/Users/User/projects/4.Frost/Data")

# leer datos
YEAR_2016 = read.csv("C:/Users/User/projects/SEQUIA/tmins/2018_TMIN.csv", header = TRUE, sep = ",")


# numero total de datos
n<- nrow(YEAR_2016)


# seleccionar las variables
PISO <- YEAR_2016  %>% select("FECHA","CODIGO","LATITUD","LONGITUD","ELEVACION","ESTACION","MUNICIPIO","DEPARTAMENTO","DATO")


# Numero de estaciones por encima de 2500 metros
PISO_1<-  PISO %>% filter(!is.na(ELEVACION) & ELEVACION >= 2500)

n_2500 <- nrow(PISO_1)

#rEGISTROS DE ESTACIONES  por encima de 2500 metros

E_sup_2500 <- (n_2500/n)*100
E_sup_2500

# de los registros  que estan por por encima de los 2500 metros, las soguientes reportaton temperaturas minimas 


PISO_2 <- PISO_1 %>% filter(DATO <=0)

N_2500_0 <- nrow(PISO_2)

PORCENTAJE<- (N_2500_0/n_2500)*100
PORCENTAJE

write.table(PISO_2, "TABLA_2016_REGISTRO_MIN.csv")

tabla_estadist?stica <- as.numeric( c(n,n_2500,E_sup_2500,N_2500_0,PORCENTAJE))
round(tabla_estadist?stica,1)
names(tabla_estadist?stica)<- c("TOTAL REGISTROS", "EST_2500", "% ESTACIONES > 2500", "REG_2500_CERO", "% REG O GRADOS")

View(tabla_estadist?stica)


hist(PISO_2$DATO)



