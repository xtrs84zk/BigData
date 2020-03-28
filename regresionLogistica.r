## se realiza la lectura del dataframe
datos <- read.table("https://github.com/xtrs84zk/BigData/blob/master/data.txt?raw=true", header = TRUE)
names(datos)

##
library(ggplot2)
tabla <- table(datos$item_id, datos$rating,
               dnn = c("item_id","rating"))
addmargins(tabla)

tabla_frecuencias <- prop.table(tabla)*100
addmargins(tabla_frecuencias)

ggplot(data = datos, aes(x = item_id, y = user_id, colour = rating)) +
  geom_boxplot() +
  theme_bw() +
  theme(legend.position = "bottom")