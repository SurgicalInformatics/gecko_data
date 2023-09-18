library(tidyverse)


patient_data_orig <- list("token"=Sys.getenv("gecko_data_collection_token"),
                          content='report',
                          action='export',
                          format='csv',
                          type='flat',
                          csvDelimiter='',
                          report_id= 507,
                          rawOrLabel='label',
                          rawOrLabelHeaders='raw',
                          exportCheckboxLabel='false',
                          exportSurveyFields='false',
                          exportDataAccessGroups='false',
                          returnFormat='json') %>% 
  httr::POST(Sys.getenv("redcap_globalsurg_uri"), body = ., encode = "form") %>% 
  httr::content(guess_max = Inf)

data = patient_data_orig
source("GECKODataCollection-ArgonautDataPullRiin_R_2023-09-11_0813.r")
patient_data_orig = data
#save(patient_data_orig, file = "patient_data_orig.rda")
rm(data)
