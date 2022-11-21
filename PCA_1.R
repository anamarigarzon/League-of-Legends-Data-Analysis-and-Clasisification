dataset <- read.csv("/Users/mac/Documents/Juan Manuel/UR/2022-2/AED/Proyecto/Dataframe_PCA.csv", header = TRUE)
dataset
#Adición de las columnas que recogen las sumas (experiencia, daños y control)
dataset$team_100_xp = dataset$Player_1_xp + dataset$Player_2_xp + dataset$Player_3_xp +
  dataset$Player_4_xp + dataset$Player_5_xp
dataset$team_200_xp = dataset$Player_6_xp + dataset$Player_7_xp + dataset$Player_8_xp +
  dataset$Player_9_xp + dataset$Player_10_xp

dataset$team_100_dmg_dealt = dataset$Player_1_dmg_dealt + dataset$Player_2_dmg_dealt + dataset$Player_3_dmg_dealt +
  dataset$Player_4_dmg_dealt + dataset$Player_5_dmg_dealt
dataset$team_200_dmg_dealt = dataset$Player_6_dmg_dealt + dataset$Player_7_dmg_dealt + dataset$Player_8_dmg_dealt +
  dataset$Player_9_dmg_dealt + dataset$Player_10_dmg_dealt

dataset$team_100_dmg_taken = dataset$Player_1_dmg_taken + dataset$Player_2_dmg_taken + dataset$Player_3_dmg_taken +
  dataset$Player_4_dmg_taken + dataset$Player_5_dmg_taken
dataset$team_200_dmg_taken = dataset$Player_6_dmg_taken + dataset$Player_7_dmg_taken + dataset$Player_8_dmg_taken +
  dataset$Player_9_dmg_taken + dataset$Player_10_dmg_taken

dataset$team_100_time_ccing = dataset$Player_1_time_ccing + dataset$Player_2_time_ccing + dataset$Player_3_time_ccing +
  dataset$Player_4_time_ccing + dataset$Player_5_time_ccing
dataset$team_200_time_ccing = dataset$Player_6_time_ccing + dataset$Player_7_time_ccing + dataset$Player_8_time_ccing +
  dataset$Player_9_time_ccing + dataset$Player_10_time_ccing

#Retirar las singulares
dataset$Player_1_gold = NULL
dataset$Player_2_gold = NULL
dataset$Player_3_gold = NULL
dataset$Player_4_gold = NULL
dataset$Player_5_gold = NULL
dataset$Player_6_gold = NULL
dataset$Player_7_gold = NULL
dataset$Player_8_gold = NULL
dataset$Player_9_gold = NULL
dataset$Player_10_gold = NULL

dataset$Player_1_xp = NULL
dataset$Player_2_xp = NULL
dataset$Player_3_xp = NULL
dataset$Player_4_xp = NULL
dataset$Player_5_xp = NULL
dataset$Player_6_xp = NULL
dataset$Player_7_xp = NULL
dataset$Player_8_xp = NULL
dataset$Player_9_xp = NULL
dataset$Player_10_xp = NULL

dataset$Player_1_dmg_dealt = NULL
dataset$Player_2_dmg_dealt = NULL
dataset$Player_3_dmg_dealt = NULL
dataset$Player_4_dmg_dealt = NULL
dataset$Player_5_dmg_dealt = NULL
dataset$Player_6_dmg_dealt = NULL
dataset$Player_7_dmg_dealt = NULL
dataset$Player_8_dmg_dealt = NULL
dataset$Player_9_dmg_dealt = NULL
dataset$Player_10_dmg_dealt = NULL

dataset$Player_1_dmg_taken = NULL
dataset$Player_2_dmg_taken = NULL
dataset$Player_3_dmg_taken = NULL
dataset$Player_4_dmg_taken = NULL
dataset$Player_5_dmg_taken = NULL
dataset$Player_6_dmg_taken = NULL
dataset$Player_7_dmg_taken = NULL
dataset$Player_8_dmg_taken = NULL
dataset$Player_9_dmg_taken = NULL
dataset$Player_10_dmg_taken = NULL

dataset$Player_1_time_ccing = NULL
dataset$Player_2_time_ccing = NULL
dataset$Player_3_time_ccing = NULL
dataset$Player_4_time_ccing = NULL
dataset$Player_5_time_ccing = NULL
dataset$Player_6_time_ccing = NULL
dataset$Player_7_time_ccing = NULL
dataset$Player_8_time_ccing = NULL
dataset$Player_9_time_ccing = NULL
dataset$Player_10_time_ccing = NULL

dataset

pca = prcomp(dataset, scale = TRUE)
pca
