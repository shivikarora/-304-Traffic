#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Shivik Arora [CHANGE THIS TO YOUR NAME!!!!]
# Data: 30 April 2022
# Contact: shivik.arora@mail.utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data.csv"
                     )
# Just keep some variables that may be of interest (change 
# this depending on your interests)
df <-dplyr::select(data, -c('DATE', 'TIME','OFFSET', 'WARDNUM','LOCCOORD','ACCLOC','TRAFFCTL', 'RDSFCOND', 'INITDIR', 'VEHTYPE', 'MANOEUVER','POLICE_DIVISION', 'HOOD_ID', 'NEIGHBOURHOOD', 'ObjectId', 'STREET1', 'STREET2', 'ROAD_CLASS', 'ACCNUM', 'X_id', 'latitude','longitude', 'altitude', 'geometry', 'FATAL_NO', 'DRIVACT', 'DRIVCOND', 'PEDTYPE', 'CYCLISTYPE', 'PEDACT', 'CYCACT', 'PEDCOND', 'CYCCOND', 'INVAGE', 'IMPACTYPE', 'DIVISION', 'DISABILITY','ACCLASS'))


#### What's next? ####

#Remove entries which are incomplete/NA/ or not useful

df <- subset(df, VISIBILITY != "")
df <- subset(df, LIGHT != "Other")
df <- subset(df, INJURY != "None")
df <- subset(df, INJURY != "")
df <- subset(df, INVTYPE != "Vehicle Owner")
df <- subset(df, INVTYPE != "Other Property Owner")

#Prepare and organize. Put 'No' where it is implied but there is no entry. Modify certain columns as shown. 
df <- df %>%
  mutate(across(c("PEDESTRIAN"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("MOTORCYCLE"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("PASSENGER"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("REDLIGHT"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("SPEEDING"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("TRSN_CITY_VEH"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("TRUCK"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("ALCOHOL"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("CYCLIST"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("EMERG_VEH"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("AG_DRIV"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("AUTOMOBILE"), ~ifelse(.=="", "No", as.character(.))))
df <- df %>%
  mutate(across(c("INJURY"), ~ifelse(.=="Minimal", "Minor", as.character(.))))
df <- df %>%
  mutate(across(c("DISTRICT"), ~ifelse(.=="", "NA", as.character(.))))
df <- df %>%
  mutate(across(c("LIGHT"), ~ifelse(.=="Other", "NA", as.character(.))))
df <- df %>%
  mutate(across(c("LIGHT"), ~ifelse(.=="Dark, artificial", "Dark", as.character(.))))
df <- df %>%
  mutate(across(c("LIGHT"), ~ifelse(.=="Dawn, artificial", "Dawn", as.character(.))))
df <- df %>%
  mutate(across(c("LIGHT"), ~ifelse(.=="Daylight, artificial", "Daylight", as.character(.))))
df <- df %>%
  mutate(across(c("LIGHT"), ~ifelse(.=="Dusk, artificial", "Dusk", as.character(.))))
df <- df %>%
  mutate(across(c("VISIBILITY"), ~ifelse(.=="", "NA", as.character(.))))



         