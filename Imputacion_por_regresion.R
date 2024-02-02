
install.packages("mice")
library(mice)
# Carga el conjunto de datos iris
data(iris)

# Crear valores faltantes en las columnas especificadas
set.seed(123)  # semilla
iris_na <- iris
iris_na$Sepal.Length[c(23, 24, 38, 2, 35, 16, 17)] <- NA
iris_na$Petal.Length[c(5, 78, 120, 89, 145, 50, 78, 103, 128)] <- NA

# imputación por regresión
imputed_data <- mice(iris_na, method = "norm", m = 5)  # m = número de imputaciones

# conjunto de datos imputado
imputed_data_complete <- complete(imputed_data)

# Visualizar el conjunto de datos imputado
head(imputed_data_complete)
