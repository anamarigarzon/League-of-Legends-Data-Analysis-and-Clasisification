#champions <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/git/League-of-Legends-Data-Analysis-and-Clasisification/champs/
#Mage.csv")
library(dplyr)
library(plyr)
library(MASS)
library(caret)
library(ggplot2)

champions <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/Stats.csv", header = TRUE)
champions <- champions[champions$tag1 == "Mage" | champions$tag1 == "Support",]

#champions$tag1 = revalue(champions$tag1, c("Assassin"=1, "Fighter"=2, "Mage"=3, "Marksman"=4, "Support"=5, "Tank"=6))
champions$tag2 = NULL
champions$name = NULL
champions$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
champions$crit = NULL
champions$critperlevel = NULL


champions$sample <- sample(c(TRUE, FALSE), nrow(champions), replace=TRUE, prob=c(0.8,0.2))

entrenamiento  <- champions[champions$sample == TRUE,]
test   <- champions[champions$sample == FALSE,]
entrenamiento$sample = NULL
test$sample = NULL

modelo <- lda(tag1~., data=entrenamiento)
modelo$prior

prediccion <- predict(modelo, test)
prediccion$class
test_labels=c(test$tag1)
matriz_c = confusionMatrix(as.factor(prediccion$class), as.factor(test_labels))
matriz_c$table

