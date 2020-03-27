fuente <- "https://github.com/xtrs84zk/BigData/blob/master/data.txt?raw=true"
datos<- fuente
head(fuente)

## Mediante un muestreo aleatorio definimos una tabla de aprendizaje para el modelo y una tabla de pruebas para verificar su calidad predictiva
muestra <- sample(1:150, 50)
testing <- datos[muestra, ]
aprendizaje <- datos[-muestra, ]
dim(testing)[1]

## Construimos el modelo alimentandolo con los datos de aprendizaje, se le indica el valor máximo de K que el modelo puede usar y él determina el óptimo.
suppressWarnings(suppressMessages(library(kknn)))
modelo <- train.kknn(item_id ~ ., data = aprendizaje, kmax = 9)
modelo



prediction <- predict(modelo, testing[, -9])
prediction

## To begin analyzing the quality of the model can build a confusion matrix. Each column of the matrix represents the number of predictions of each class, while each row represents the instances in the actual class.
calidadDelModelo <- table(testing[,4], prediction)
calidadDelModelo

##We must check for accuracy
accuracy <- (sum(diag(calidadDelModelo)))/sum(calidadDelModelo)
accuracy

##graphically plot
plot(modelo)