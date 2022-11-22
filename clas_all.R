#champions <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/git/League-of-Legends-Data-Analysis-and-Clasisification/champs/
#Mage.csv")
library(dplyr)
library(plyr)
library(MASS)
library(caret)
library(ggplot2)

champions <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/Stats.csv", header = TRUE)
fighters <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Fighter.csv", header = TRUE)
mage <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Mage.csv", header = TRUE)
assassin <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Assassin.csv", header = TRUE)
tank <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Tank.csv", header = TRUE)
support <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Support.csv", header = TRUE)
marksman <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/champs/Marksman.csv", header = TRUE)

#champions$tag1 = revalue(champions$tag1, c("Assassin"=1, "Fighter"=2, "Mage"=3, "Marksman"=4, "Support"=5, "Tank"=6))
fighters$tag2 = NULL
fighters$name = NULL
fighters$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
fighters$crit = NULL
fighters$critperlevel = NULL

#champions$tag1 = revalue(champions$tag1, c("Assassin"=1, "Fighter"=2, "Mage"=3, "Marksman"=4, "Support"=5, "Tank"=6))
mage$tag2 = NULL
mage$name = NULL
mage$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
mage$crit = NULL
mage$critperlevel = NULL

#champions$tag1 = revalue(champions$tag1, c("Assassin"=1, "Fighter"=2, "Mage"=3, "Marksman"=4, "Support"=5, "Tank"=6))
assassin$tag2 = NULL
assassin$name = NULL
assassin$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
assassin$crit = NULL
assassin$critperlevel = NULL

#champions$tag1 = revalue(champions$tag1, c("Assassin"=1, "Fighter"=2, "Mage"=3, "Marksman"=4, "Support"=5, "Tank"=6))
tank$tag2 = NULL
tank$name = NULL
tank$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
tank$crit = NULL
tank$critperlevel = NULL

#champions$tag1 = revalue(champions$tag1, c("Assassin"=1, "Fighter"=2, "Mage"=3, "Marksman"=4, "Support"=5, "Tank"=6))
support$tag2 = NULL
support$name = NULL
support$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
support$crit = NULL
support$critperlevel = NULL

#champions$tag1 = revalue(champions$tag1, c("Assassin"=1, "Fighter"=2, "Mage"=3, "Marksman"=4, "Support"=5, "Tank"=6))
marksman$tag2 = NULL
marksman$name = NULL
marksman$key = NULL
#Como crit y critperlevel son siempre cero, se borran o R pone problema
marksman$crit = NULL
marksman$critperlevel = NULL


set.seed(2003)
fighters$sample <- sample(c(TRUE, FALSE), nrow(fighters), replace=TRUE, prob=c(0.7,0.3))
tank$sample <- sample(c(TRUE, FALSE), nrow(tank), replace=TRUE, prob=c(0.7,0.3))
assassin$sample <- sample(c(TRUE, FALSE), nrow(assassin), replace=TRUE, prob=c(0.7,0.3))
support$sample <- sample(c(TRUE, FALSE), nrow(support), replace=TRUE, prob=c(0.7,0.3))
mage$sample <- sample(c(TRUE, FALSE), nrow(mage), replace=TRUE, prob=c(0.7,0.3))
marksman$sample <- sample(c(TRUE, FALSE), nrow(marksman), replace=TRUE, prob=c(0.7,0.3))

entrenamiento  <- rbind(fighters[fighters$sample == TRUE,],tank[tank$sample == TRUE,],assassin[assassin$sample == TRUE,],
                        support[support$sample == TRUE,],mage[mage$sample == TRUE,],marksman[marksman$sample == TRUE,])
test  <- rbind(fighters[fighters$sample == FALSE,],tank[tank$sample == FALSE,],assassin[assassin$sample == FALSE,],
                        support[support$sample == FALSE,],mage[mage$sample == FALSE,],marksman[marksman$sample == FALSE,])

entrenamiento$sample = NULL
test$sample = NULL

modelo <- lda(tag1~., data=entrenamiento)
modelo$prior

prediccion <- predict(modelo, test)
prediccion$class
test_labels=c(test$tag1)
matriz_c = confusionMatrix(as.factor(prediccion$class), as.factor(test_labels))
matriz_c$table #c:

