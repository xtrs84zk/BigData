# Y entonces tendrías Veces que rentó cada cliente | veces que se rentó cada película | rating | hora promedio en que rentó

datos <- read.table("https://github.com/xtrs84zk/BigData/blob/master/data.txt?raw=true", header = TRUE)
names(datos)
##View(datos)

##graficar los datos para comprobar que hay relación
plot(datos$user_id,datos$timestamp)
plot(datos$user_id,df$rentsByUser)


##Cuántas veces rentó esa película cada cliente
datos$occ <- ave(seq(nrow(datos)), datos$user_id, datos$item_id, FUN = length)
plot(datos$item_id,datos$occ)
##vaya, literalmente fue una sola vez, ningún cliente volvió a rentar la misma película

##convertir y modificar todo en df
df <- datos

## ¿Cuántas veces se rentó cada película?
timesByMovie <- as.data.frame(table(datos$item_id)) 
tbl <- table(df$item_id)
df$rentsByItem <- tbl[match(df$item_id, names(tbl))]
df$rentsByItem[is.na(df$item_id)] <- 0
df

## ¿hay una limitante en el tamaño de objeto a analizar?
NROW(na.omit(df$rentsByItem))
NROW(na.omit(df$rentsByUser))
##pareciera que no la hay, interesante

##probemos de nuevo
sum(complete.cases(df$rentsByUser))
##about to cry

##meh
plot(cbind(df$rentsByItem[1], df$rentsByUser[1,]))

## ¿Cuántas veces rentó cada cliente?
timesByUser <- as.data.frame(table(datos$user_id)) 

##agregando a la tabla df
tbl <- table(df$user_id)
df$rentsByUser <- tbl[match(df$user_id, names(tbl))]
df$rentsByUser[is.na(df$user_id)] <- 0
df


vector <- c()
for(i in datos$user_id){
    for(p in timesByUser$Var1){
        if(i==p){
            vector <- c(vector,timesByUser$Freq)
        }
    }
}

temporal <- c('rentsByC')
continue <- TRUE
while(continue){
    for(i in datos$user_id){
        cantidad <- 0
        for(k in datos$user_id){
            if(i==k){
                cantidad <- cantidad + 1
            }
        }
        temporal <- c(temporal,cantidad)
    }
if(temporal.length > datos$user_id.length){
    continue <- FALSE
}
}
datos$rentsByUsr <- temporal

abc <- aggregate(datos$user_id, by=list(data$timestamp), FUN=mean)[2]

library(dplyr)
df1 <- subset(as.data.frame(table(datos)), Freq != 0)