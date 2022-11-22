#champions <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/git/League-of-Legends-Data-Analysis-and-Clasisification/champs/
                     #Mage.csv")
library(dplyr)
library(plyr)
library(MASS)
library(caret)
library(ggplot2)

fighters <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Fighter.csv", header = TRUE)
mage <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Mage.csv", header = TRUE)
assassin <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Assassin.csv", header = TRUE)
tank <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Tank.csv", header = TRUE)
support <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Support.csv", header = TRUE)
marksman <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Marksman.csv", header = TRUE)

champions <- rbind(fighters, mage, assassin, tank, support, marksman)
champions$tag1 = NULL
champions$tag2 = NULL
champions$name = NULL
champions$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
champions$crit = NULL
champions$critperlevel = NULL
champions$good = (champions$winrate >= 0.5)

#set.seed(2003)
champions$sample <- sample(c(TRUE, FALSE), nrow(champions), replace=TRUE, prob=c(0.8,0.2))

entrenamiento  <- champions[champions$sample == TRUE,]
test   <- champions[champions$sample == FALSE,]
entrenamiento$sample = NULL
test$sample = NULL

modelo <- lda(good~., data=entrenamiento)
modelo$prior

prediccion <- predict(modelo, test)

test_labels=c(test$good)
matriz_c = confusionMatrix(as.factor(prediccion$class), as.factor(test_labels))
matriz_c$table

tab_fin_test=as_tibble(matriz_c$table)
colnames(tab_fin_test)=c("Target","Prediction","N")
plot_confusion_matrix(tab_fin_test)
