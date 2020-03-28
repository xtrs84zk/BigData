datos <- read.table("https://github.com/xtrs84zk/BigData/blob/master/data.txt?raw=true", header = TRUE)
names(datos)

df <- datos

tbl <- table(df$item_id)
df$rentsByItem <- tbl[match(df$item_id, names(tbl))]
df$rentsByItem[is.na(df$item_id)] <- 0
tbl <- table(df$user_id)
df$rentsByUser <- tbl[match(df$user_id, names(tbl))]
df$rentsByUser[is.na(df$user_id)] <- 0
df

set.seed(101) Total <- nrow(datos) Muestra <- round(100000*0.75) indices <- sample(1:Total , size=Muestra) entreno <- datos[indices,] prueba <- datos[-indices,]



#librerías
require(MASS)
require(klaR)
library(ggplot2)
library(grid)
library(gridExtra)

# Carga de datos
data(iris)
datos <- iris
View(datos)

# Selección de una submuestra del 75%
set.seed(10000)
Total <- nrow(datos)
Muestra <- round(100000*0.75)
indices <- sample(1:Total , size=Muestra)
entreno <- datos[indices,]
prueba <- datos[-indices,]

# Análisis discriminante
lda <- lda(formula= rating~. , data=entreno)
modelo_lda <- lda(rating~Sepal.Width+Sepal.Length+Petal.Length+Petal.Width,data=entreno)
modelo_lda

# probabilidad de pertenencia a cada clase
lda.p <- predict(lda, newdata=prueba, interval='confidence')

# Asignación de colores a cada rating (?) para dibujar.
color <- rep("green",nrow(entreno))
color[entreno$rating == "5"] <- "red"
color[entreno$rating == "1"] <- "blue"

# primeras componentes del AD. Abbrev abrevia los nombres
plot(lda, dimen=2, col=color, abbrev=3)

# pares de componentes.
pairs(lda, col=color, abbrev=1)

# Matriz de confusión, validación del 35% de datos restantes.
mc <- table(lda.p$class, prueba$rating)
mc

# Correctamente clasificados en %
100 * sum(diag(mc)) / sum(mc)