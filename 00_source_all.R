# library(tidyverse)
# library(pins)
# library(finalfit)

# Pull and clean data ----

# 01_pull.R no longer actively pulls from REDCap as the project is no longer editable by collaborators
# edit 01_pull.R if need a fresh REDCap pull
source("01_pull.R")
#save(patient_data_orig, file = "patient_data_orig.rda")
#load("patient_data_orig.rda")
source("02_join_world_bank.R")
source("03_checkbox_variable_handling.R")
source("04_cut_collapse.R")
source("05_cleaning.R")


# Shiny data: Selection of variables and minor modifications ----

shinyviz_vars = read_lines("shinyviz_varlist.txt")

appdata = patient_data %>% 
  filter(internal_check == "Pass - included in analysis") %>% 
  select(all_of(shinyviz_vars), redcap_data_access_group)

labels_keep_appdata = extract_variable_label(appdata)

# set missing BDIs to No as we away 1-year results
appdata = appdata %>% 
  mutate(bdi_yn = if_else(bdi_yn == "Missing", "No", bdi_yn)) %>% 
  mutate(across(where(is.factor), ~fct_na_value_to_level(., level = "Missing"))) %>%
  mutate(ALL = "ALL", .before = period) %>% 
  ff_relabel(labels_keep_appdata)

# Pins update ----
board = pins::board_connect()
# for analysis:
board %>% pins::pin_write(patient_data, name = "gecko_patient_data")
# for shinyviz:
board %>% pins::pin_write(appdata, name = "gecko_appdata")

rm(appdata, board, patient_data_orig, labels_keep_appdata, shinyviz_vars)