library("rjson")
archivoConElJSON <- "http://api.worldbank.org/country?per_page=10&region=OED&lendingtype=LNX&format=json"
##Se intenta continuar la ejecución cargando el archivo cada vez
while(TRUE)
{
    ## Se intenta leer el archivo json y se ignora el error si no se encuentra
    try(result <- fromJSON(file = archivoConElJSON))
    ##aún no logro filtrar la información
    df2 <- as.data.frame(lapply(result, unlist))
    barplot(table(df2),main = "Gráfica",xlab ="Latitudes",ylab = "Longitudes", col = cm.colors(8), density=10)
    Sys.sleep(10)
}