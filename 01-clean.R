#Cargar paquetes

pacman::p_load("vroom", "dplyr")

#Leer la data
la_data <- vroom(file="data/data_original.csv")

#Filtrar por doctor y doctora 

data_filtrada <- la_data %>% 
  filter(nobilis == "DR." | nobilis == "DRA.")

#Creamos un directorio de resultados
dir.create(path="results")

#guardar esta data 

write.csv (x = data_filtrada, file ="results/limpia.csv")
