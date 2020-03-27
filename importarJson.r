library("rjson")
json_file <- "http://api.worldbank.org/country?per_page=10&region=OED&lendingtype=LNX&format=json"
json_data <- fromJSON(paste(readLines(json_file),collapse=""))
class(json_data)

#longitudes y latitudes
for(i in json_data){
    print(i) ##$latitude)
}


primerNodo <- 1
while (1 < 5){
    segundoNodo <- 1
    while(segundoNodo<5){
        json_data[[primerNodo]][[segundoNodo]]
    segundoNodo <- segundoNodo +1
    }
    primerNodo <- primerNodo + 1
}

##longitudes y latitudes x2
df <- lapply(json_data, function(play) # Loop through each "play"
  {
  # Convert each group to a data frame.
  data.frame(matrix(unlist(play), ncol=4, byrow=T))
  })

df <- do.call(rbind, df)