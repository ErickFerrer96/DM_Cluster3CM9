Happy <- read.csv("/Users/Erick/Desktop/Examen_Cluster/Base2017/2017.csv")

rownames(Happy) = Happy$Country

Happy$Country = NULL

Happy.scaled = as.data.frame(scale(Happy))
 
library(devtools)
devtools::install_github("kassambara/factoextra")

km <- kmeans(Happy.scaled,6)
km

aggregate(Happy.scaled, by = list(cluster = km$cluster),mean)

library(factoextra)
fviz_cluster(km,data = Happy.scaled)
