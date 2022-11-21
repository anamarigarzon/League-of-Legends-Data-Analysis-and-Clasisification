
# Manova - Diferencia de medias entre equipos que ganan y equipos que pierden

library(dplyr) # importar librerías

data1 <- read.csv("Proyecto AED\\Dataframe_clean.csv", header=TRUE, stringsAsFactors=FALSE) # Cargando el dataset

# Datos de los equipos ganadores 

data1_victory_100 <- data1[data1$teamVictory==100,]
data1_victory_200 <- data1[data1$teamVictory==200,]

data1_victory_100 <- subset (data1_victory_100, select = -c(X,gameId,matchId,gameDuration,teamVictory,Player_1_position,Player_2_position,Player_3_position,Player_4_position,Player_5_position,Player_1_team,Player_2_team,Player_3_team,Player_4_team,Player_5_team,Player_6_pick:Player_10_time_ccing)) # Eliminando columnas innecesarias
data1_victory_200 <- subset (data1_victory_200, select = -c(X,gameId,matchId,gameDuration,teamVictory,Player_1_pick:Player_5_time_ccing,Player_6_position,Player_7_position,Player_8_position,Player_9_position,Player_10_position,Player_6_team,Player_7_team,Player_8_team,Player_9_team,Player_10_team)) # Eliminando columnas innecesarias

data1_victory_200 <- data1_victory_200[c ("team_200_gold","team_100_gold","Player_6_pick","Player_6_gold","Player_6_xp","Player_6_dmg_dealt","Player_6_dmg_taken","Player_6_time_ccing","Player_7_pick","Player_7_gold","Player_7_xp","Player_7_dmg_dealt","Player_7_dmg_taken","Player_7_time_ccing","Player_8_pick","Player_8_gold","Player_8_xp","Player_8_dmg_dealt","Player_8_dmg_taken","Player_8_time_ccing","Player_9_pick","Player_9_gold","Player_9_xp","Player_9_dmg_dealt","Player_9_dmg_taken","Player_9_time_ccing","Player_10_pick","Player_10_gold","Player_10_xp","Player_10_dmg_dealt","Player_10_dmg_taken","Player_10_time_ccing")] #Cambiando el orden de las columnas para que coincida con la anterior
data1_victory_200 <- data1_victory_200 %>% rename (winner_gold = team_200_gold, loser_gold = team_100_gold,Player_1_pick = Player_6_pick,Player_1_gold=Player_6_gold,Player_1_xp=Player_6_xp,Player_1_dmg_dealt=Player_6_dmg_dealt,Player_1_dmg_taken=Player_6_dmg_taken, Player_1_time_ccing=Player_6_time_ccing,
                              Player_2_pick = Player_7_pick,Player_2_gold=Player_7_gold,Player_2_xp=Player_7_xp,Player_2_dmg_dealt=Player_7_dmg_dealt,Player_2_dmg_taken=Player_7_dmg_taken, Player_2_time_ccing=Player_7_time_ccing,
                              Player_3_pick = Player_8_pick,Player_3_gold=Player_8_gold,Player_3_xp=Player_8_xp,Player_3_dmg_dealt=Player_8_dmg_dealt,Player_3_dmg_taken=Player_8_dmg_taken, Player_3_time_ccing=Player_8_time_ccing,
                              Player_4_pick = Player_9_pick,Player_4_gold=Player_9_gold,Player_4_xp=Player_9_xp,Player_4_dmg_dealt=Player_9_dmg_dealt,Player_4_dmg_taken=Player_9_dmg_taken, Player_4_time_ccing=Player_9_time_ccing,
                              Player_5_pick = Player_10_pick,Player_5_gold=Player_10_gold,Player_5_xp=Player_10_xp,Player_5_dmg_dealt=Player_10_dmg_dealt,Player_5_dmg_taken=Player_10_dmg_taken, Player_5_time_ccing=Player_10_time_ccing)

data1_victory_100 <- data1_victory_100 %>% rename (winner_gold = team_100_gold,loser_gold = team_200_gold)

data1_victory <- merge(data1_victory_100, data1_victory_200, all = TRUE)

# Datos de los equipos perdedores

data1_victory_100 <- data1[data1$teamVictory==100,]
data1_victory_200 <- data1[data1$teamVictory==200,]

data1_defeat_100 <- subset (data1_victory_200, select = -c(X,gameId,matchId,gameDuration,teamVictory,Player_1_position,Player_2_position,Player_3_position,Player_4_position,Player_5_position,Player_1_team,Player_2_team,Player_3_team,Player_4_team,Player_5_team,Player_6_pick:Player_10_time_ccing)) # Eliminando columnas innecesarias
data1_defeat_200 <- subset (data1_victory_100, select = -c(X,gameId,matchId,gameDuration,teamVictory,Player_1_pick:Player_5_time_ccing,Player_6_position,Player_7_position,Player_8_position,Player_9_position,Player_10_position,Player_6_team,Player_7_team,Player_8_team,Player_9_team,Player_10_team)) # Eliminando columnas innecesarias
data1_defeat_100 <- data1_defeat_100[c ("team_200_gold","team_100_gold","Player_1_pick","Player_1_gold","Player_1_xp","Player_1_dmg_dealt","Player_1_dmg_taken","Player_1_time_ccing","Player_2_pick","Player_2_gold","Player_2_xp","Player_2_dmg_dealt","Player_2_dmg_taken","Player_2_time_ccing","Player_3_pick","Player_3_gold","Player_3_xp","Player_3_dmg_dealt","Player_3_dmg_taken","Player_3_time_ccing","Player_4_pick","Player_4_gold","Player_4_xp","Player_4_dmg_dealt","Player_4_dmg_taken","Player_4_time_ccing","Player_5_pick","Player_5_gold","Player_5_xp","Player_5_dmg_dealt","Player_5_dmg_taken","Player_5_time_ccing")] #Cambiando el orden de las columnas para que coincida con la anterior
data1_defeat_100 <- data1_defeat_100 %>% rename (winner_gold = team_200_gold,loser_gold = team_100_gold)
data1_defeat_200 <- data1_defeat_200 %>% rename (winner_gold = team_100_gold, loser_gold = team_200_gold,Player_1_pick = Player_6_pick,Player_1_gold=Player_6_gold,Player_1_xp=Player_6_xp,Player_1_dmg_dealt=Player_6_dmg_dealt,Player_1_dmg_taken=Player_6_dmg_taken, Player_1_time_ccing=Player_6_time_ccing,
                                                   Player_2_pick = Player_7_pick,Player_2_gold=Player_7_gold,Player_2_xp=Player_7_xp,Player_2_dmg_dealt=Player_7_dmg_dealt,Player_2_dmg_taken=Player_7_dmg_taken, Player_2_time_ccing=Player_7_time_ccing,
                                                   Player_3_pick = Player_8_pick,Player_3_gold=Player_8_gold,Player_3_xp=Player_8_xp,Player_3_dmg_dealt=Player_8_dmg_dealt,Player_3_dmg_taken=Player_8_dmg_taken, Player_3_time_ccing=Player_8_time_ccing,
                                                   Player_4_pick = Player_9_pick,Player_4_gold=Player_9_gold,Player_4_xp=Player_9_xp,Player_4_dmg_dealt=Player_9_dmg_dealt,Player_4_dmg_taken=Player_9_dmg_taken, Player_4_time_ccing=Player_9_time_ccing,
                                                   Player_5_pick = Player_10_pick,Player_5_gold=Player_10_gold,Player_5_xp=Player_10_xp,Player_5_dmg_dealt=Player_10_dmg_dealt,Player_5_dmg_taken=Player_10_dmg_taken, Player_5_time_ccing=Player_10_time_ccing)

data1_defeat <- merge(data1_defeat_100, data1_defeat_200, all = TRUE)
