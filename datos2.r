ruta <- "/Users/xtrs84zk/Desktop/datos.txt"
vdatos
barplot(table(vdatos),main='Grafica de Frecuencias',xlab='Grados'),
ylab='Temperatura', col=cm.color(15))
tdatos <- table(vdatos)
tdatos
v_datos <- vector("numeric",0)
i <- 1
while(TRUE){
    if(file.exists(ruta)){
        print("archivo existe")
        leer <- c(scan(ruta,sep=','))
        v_datos[i]<-(leer[2])
        i <- i + 1
        barplot(table(v_datos),
        main = 'Grafico de Temperaturas',
        xlab = 'Grados',
        ylab = 'Temperaturas',
        col=cm.colors(14),
        density=10)
    } else {
        print('Archivo no existe')
    }
    Sys.sleep(5)
}