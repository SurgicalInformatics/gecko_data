library(tidyverse)

# patient_data_orig <- list("token"=Sys.getenv("gecko_data_collection_token"),
#                           content='report',
#                           action='export',
#                           format='csv',
#                           type='flat',
#                           csvDelimiter='',
#                           report_id= 534,
#                           rawOrLabel='raw',
#                           rawOrLabelHeaders='raw',
#                           exportCheckboxLabel='false',
#                           exportSurveyFields='false',
#                           exportDataAccessGroups='false',
#                           returnFormat='json') %>%
#   httr::POST(Sys.getenv("redcap_globalsurg_uri"), body = ., encode = "form") %>%
#   httr::content(guess_max = Inf)
# 
#save(patient_data_orig, file = "data_raw/gecko_redcap_pull_march2025.rda")
load("data_raw/gecko_redcap_pull_march2024.rda")

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
