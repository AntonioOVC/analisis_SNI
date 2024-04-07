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


#Calcular la proporcion de Doctores y Doctoraas que pierden SNI 

data_resumen <- data_filtrada %>% 
  filter(cambio == "perdio SNI") %>%
  group_by(nobilis) %>%
  summarise (totales = sum(miembros))


# Guardamos la data resumen
write.csv( x = data_resumen, file = "results/resumen.csv" )



#To-do 
#antoniooc: calcular el porcentaje de dr y dra que pierden el SNI 
# como total ingresos/ total perdidas.