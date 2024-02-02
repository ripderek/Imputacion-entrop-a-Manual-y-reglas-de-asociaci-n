#install.packages("arules")
library(arules)
# Carga el conjunto de datos iris
data(iris)

# Selecciona las columnas relevantes (longitud del sépalo, ancho y longitud del pétalo)
iris_subset <- iris[, c("Sepal.Length", "Petal.Width", "Petal.Length")]

# Convierte las medidas a factores para discretizarlas
iris_factors <- lapply(iris_subset, function(x) cut(x, breaks = 5))

# Crea un objeto transactions
trans <- as(iris_factors, "transactions")

# Aplica el algoritmo Apriori
rules <- apriori(trans, parameter = list(support = 0.1, confidence = 0.6))

# Ordena las reglas por la métrica que desees (por ejemplo, lift)
rules <- sort(rules, by = "lift", decreasing = TRUE)

# Muestra las reglas y sus métricas
inspect(rules)
