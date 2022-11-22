#fighters <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/git/League-of-Legends-Data-Analysis-and-Clasisification/champs/
                     #Mage.csv")
library(dplyr)
library(MASS)
library(caret)
library(ggplot2)
fighters <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Fighter.csv", header = TRUE)

fighters$tag1 = NULL
fighters$tag2 = NULL
fighters$name = NULL
fighters$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
fighters$crit = NULL
fighters$critperlevel = NULL
fighters$good = (fighters$winrate >= 0.5)
fighters$good = as.numeric(as.logical(fighters$good))

set.seed(2003)
fighters$sample <- sample(c(TRUE, FALSE), nrow(fighters), replace=TRUE, prob=c(0.8,0.2))

entrenamiento  <- fighters[fighters$sample == TRUE,]
test   <- fighters[fighters$sample == FALSE,]
entrenamiento$sample = NULL
test$sample = NULL

modelo <- lda(good~., data=entrenamiento)
modelo$prior

prediccion <- predict(modelo, test)

test_labels=c(test$good)
matriz_c = confusionMatrix(as.factor(prediccion$class), as.factor(test_labels))
matriz_c$table
