

assassin <- read.csv("C:\\Users\\garzo\\Documents\\OneNote Notebooks\\Proyecto AED\\champs\\champs\\Assassin.csv", header = TRUE)
fighters <- read.csv("C:\\Users\\garzo\\Documents\\OneNote Notebooks\\Proyecto AED\\champs\\champs\\Fighter.csv", header = TRUE)
mage <- read.csv("C:\\Users\\garzo\\Documents\\OneNote Notebooks\\Proyecto AED\\champs\\champs\\Mage.csv", header = TRUE)
marksman <- read.csv("C:\\Users\\garzo\\Documents\\OneNote Notebooks\\Proyecto AED\\champs\\champs\\Marksman.csv", header = TRUE)
support <- read.csv("C:\\Users\\garzo\\Documents\\OneNote Notebooks\\Proyecto AED\\champs\\champs\\Support.csv", header = TRUE)
tank <- read.csv("C:\\Users\\garzo\\Documents\\OneNote Notebooks\\Proyecto AED\\champs\\champs\\Tank.csv", header = TRUE)

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

data_all = rbind(assassin,fighters,mage,marksman,tank,support)
data_all$X = NULL

dependent_vars <- subset(data_all, select = -c(tag1))
independent_var <- data_all$tag1

manova_model <- manova(dependent_vars ~ independent_var, data = data_all)

