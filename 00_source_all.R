# library(tidyverse)
# library(pins)
# library(finalfit)

# Keeping the pins fixed in time for now as analysis has been undertaken
update_pins = FALSE

#### ### ### ### ### ### #### ### ###
# Part I - Riinu's code ----
# Pull and clean data
#### ### ### ### ### ### #### ### ###

#' 01_pull.R no longer actively pulls from REDCap as the project is no longer editable by collaborators
# edit 01_pull.R if need a fresh REDCap pull
source("01_pull_patient_data.R")
#save(patient_data_orig, file = "01_pull.rda")
#load("patient_data_orig.rda")

source("02_join_world_bank.R")

source("03_checkbox_variable_handling.R")
#save(patient_data, file = "03_patient_data.rda")

source("04_cut_collapse.R", echo = TRUE)
#save(patient_data, file = "04_cut_collapse.rda")

source("05_cleaning.R")


# Upload pins including Shiny app data: Selection of variables and minor modifications

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

# Pins update
if (update_pins){
  board = pins::board_connect()
  # for analysis:
  board %>% pins::pin_write(patient_data, name = "gecko_patient_data")
  # for shinyviz:
  board %>% pins::pin_write(appdata, name = "gecko_appdata")
  rm(board)
}
rm(appdata, patient_data_orig, labels_keep_appdata, shinyviz_vars)


#### ### ### ### ### ### #### ### ###
# Part II - Neil's code ----
# Join with hospital level data
#### ### ### ### ### ### #### ### ###

