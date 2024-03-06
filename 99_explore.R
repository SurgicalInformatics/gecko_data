library(tidyverse)
library(scales)
theme_set(theme_bw())

library(pins)
board = board_connect()
patient_data = pin_read(board, "rots/gecko_patient_data")

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
