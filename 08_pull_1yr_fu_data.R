library(tidyverse)
library(pins)

# fu_data_orig <- list("token"=Sys.getenv("gecko_data_collection_token"),
#                           content='report',
#                           action='export',
#                           format='csv',
#                           type='flat',
#                           csvDelimiter='',
#                           report_id= 672,
#                           rawOrLabel='raw',
#                           rawOrLabelHeaders='raw',
#                           exportCheckboxLabel='false',
#                           exportSurveyFields='false',
#                           exportDataAccessGroups='false',
#                           returnFormat='json') %>%
#   httr::POST(Sys.getenv("redcap_globalsurg_uri"), body = ., encode = "form") %>%
#   httr::content(guess_max = Inf)
# 
# save(fu_data_orig, file = "data_raw/gecko_redcap_pull_2025-04-30.rda")
load("data_raw/gecko_redcap_pull_2025-04-30.rda")

data = fu_data_orig
source("redcap_factoring/GECKODataCollection-Argonaut1yearFu1ptTG_R_2025-04-30_1336.r")

fu_data_orig = data %>% 
  mutate(internal_check = internal_check %>% 
           factor() %>% 
           fct_recode("Pass - included in analysis"             = "1",
                      "Period less than 90% complete"           = "2",
                      "Period missing - excluded from analysis" = "3")) %>% 
  filter(internal_check == "Pass - included in analysis") %>% 
  select(-internal_check) %>% 
  rename(patient_record_id = record_id)

#save(patient_data_orig, file = "patient_data_orig.rda")
rm(data)


board = board_connect()
pin_write(board, fu_data_orig, name = "rots/gecko_1yrfu_data")

