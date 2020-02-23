##Programa en R que identifique un set de números, si son pares, impares y/o primos.
##referencia: https://es.wikipedia.org/wiki/Número_primo
## Crear un vector con números del 1 al 100
i <- 2
v <- c(1)
while(i<101){
    v <- c(v,i)
    i <- i + 1
}

## Almacenar dicho vector en un archivo
write(v,file = "/Users/xtrs84zk/Desktop/datos.txt",sep = ",")

## Leer los números desde un archivo
numerosLeidos <- scan(file = "/Users/xtrs84zk/Desktop/datos.txt",sep = ",")

##preparando mensaje
mensaje <- c("Resultado del analisis:")

##verificar cada número
for(i in numerosLeidos){
    calidad <- 0
    ##verificar si es par o non
    if(i%%2==0){
        ##número par
        calidad <- 2
    } else {
        ##número impar
        calidad <- 1
    }

    ##verificar si es primo
    ##decidí hacerlo por fuerza bruta, pues ninguno de los métodos propuestos arrojaba el resultado esperado
    divisores <- 0
    segundoNivel <- 1
    while(segundoNivel <= i){
        if(i%%numerosLeidos[segundoNivel]==0){
            divisores <- divisores + 1
        }
        segundoNivel <- segundoNivel + 1
    }
    if(divisores==2){
        calidad <- calidad + 5
    }
    ##considero que esta implementación no era suficientemente precisa, aunque sí más rápida
    ##(al menos trabajando con un set de datos gigantesco), en este caso, es imperceptible
    # if(i%%3!=0){
    #     if(i%%2!=0){
    #         calidad <- calidad + 5
    #     }
    # }

    ##por convenio, 1 no es primo
    if(i==1){
        calidad <- 1
    }

    ##en este punto, un 2 sería par, un 1 impar y un seis primo (e impar) ; además, un 7 sería par primo (teóricamente, sólo el 2)
    if(calidad == 1){
    mensaje <- c(mensaje,paste("El numero", i, "es impar."))
    }
    if(calidad == 2){
    mensaje <- c(mensaje,paste("El numero", i, "es par."))
    }
    if(calidad == 6){
    mensaje <- c(mensaje,paste("El numero", i, "es impar y primo."))
    }
    if(calidad == 7){
    mensaje <- c(mensaje,paste("El numero", i, "es primo y par."))
    }
}

##escribir los resultados a un archivo
write(mensaje,file = "/Users/xtrs84zk/Desktop/datosResuelto.txt",sep = ",")