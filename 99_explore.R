library(tidyverse)
library(scales)
library(pins)
theme_set(theme_bw())



board = board_connect()
gecko_adult = pin_read(board, "siveshkk93/gecko_adult_data")
gecko_adult = tibble(gecko_adult)

gecko_1yrfu  = pin_read(board, "rots/gecko_1yrfu_data")

mismatches = anti_join(gecko_adult, gecko_1yrfu)

stopifnot(nrow(gecko_1yrfu %>% 
  filter(patient_record_id %in% mismatches$patient_record_id)) == 0)

gecko_full = left_join(gecko_adult, gecko_1yrfu)


load("data_raw/gecko_redcap_pull_2024-03-06.rda")
patient_data_rda = patient_data_orig
rm(patient_data_orig)

board = board_connect()
patient_data_pin = pin_read(board, "rots/gecko_patient_data")

library(pins)
board = board_connect()
gecko_data = pin_read(board, "siveshkk93/gecko_adult_data")



patient_data_orig %>% 
  count(internal_check)

patient_data %>% 
  filter(internal_check != "Pass - included in analysis") %>% 
  count(gender, internal_check)

patient_data %>% 
  filter(internal_check != "Pass - included in analysis") %>% 
  count(redcap_data_access_group, internal_check, sort = TRUE)


comorb = patient_data %>% 
  count(pt_comorbid, sort = TRUE) %>% 
  mutate(comorb_n = if_else(pt_comorbid == "None",
                            0,
                            str_count(pt_comorbid, ",") + 1))

# Explore differences between March 2024 (primary data lock)
# and M<arch 2025 (after 1-year follow-up data lock)

#load("data_raw/gecko_redcap_pull_march2024.rda")
load("data_raw/gecko_redcap_pull_march2025.rda")

data = patient_data_orig
source("redcap_factoring/GECKODataCollection-ArgonautDataPullRiin_R_2024-01-12_1324.r")
patient_data_orig = data %>% 
  mutate(internal_check = internal_check %>% 
           factor() %>% 
           fct_recode("Pass - included in analysis" = "1",
                      "Period less than 90% complete" = "2",
                      "Period missing - excluded from analysis" = "3"))

#save(patient_data_orig, file = "patient_data_orig.rda")
rm(data)

#patient_data_orig_march2024 = patient_data_orig
patient_data_orig_march2025 = patient_data_orig
rm(patient_data_orig)

patient_data_orig_march2024 %>%
  count(internal_check)

patient_data_orig_march2025 %>%
  count(internal_check)

patient_data_orig_march2025 %>%
  filter(is.na(internal_check))
