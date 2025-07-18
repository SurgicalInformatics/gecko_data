# Copied from Neil's argosafe project gecko
library(tidyverse)

# Pull or read in hospital level data ----
# Can't get the REDCap pull to work together with the factoring script, need to have a proper look - Riinu 11.03.2025
# hospital_data_orig <- list("token"=Sys.getenv("gecko_teamreg_token"),
#                            content='record',
#                            action='export',
#                            format='csv',
#                            type='flat',
#                            csvDelimiter='',
#                            rawOrLabel='raw',
#                            rawOrLabelHeaders='raw',
#                            exportCheckboxLabel='true',
#                            exportSurveyFields='false',
#                            exportDataAccessGroups='true',
#                            returnFormat='json',
#                            'forms[0]'='site_survey',
#                            'fields[0]'='data_collection_dag') %>% 
#   httr::POST(Sys.getenv("redcap_globalsurg_uri"), body = ., encode = "form") %>% 
#   httr::content()
# 
# 
# 
# #apply factoring script
# data = hospital_data_orig
# source("redcap_factoring/GECKOTeamRegistratio-SiteSurveyDataNeil_R_2024-02-02_1708_edited.r")
# hospital_data_orig = data
# rm(data)

# Fixed data used in Paper 1 analysis:
hospital_data_ss = read_csv("data_raw/GECKOTeamRegistratio-SiteSurveyDataNeil_DATA_2024-02-02_1708.csv")

#apply factoring script
data = hospital_data_ss
source("redcap_factoring/GECKOTeamRegistratio_R_2024-01-10_1423-edited.r")
hospital_data_ss = data
rm(data)

# columns mistakenly classed as characters
hospital_data_ss = hospital_data_ss %>% 
  mutate(hosp_itu_bed = parse_number(hosp_itu_bed)) %>% 
  mutate(service_chole_n = parse_number(service_chole_n)) %>%  # note case of "500+"
  mutate(service_cons_n = parse_number(service_cons_n)) %>%  # note case of "100+"
  mutate(service_cons_lap_n = parse_number(service_cons_lap_n)) %>% 
  mutate(service_eme_n = parse_number(service_eme_n))

df_hospital = hospital_data_ss %>% 
  rename("redcap_data_access_group_orig" = "redcap_data_access_group") %>% 
  rename("redcap_data_access_group" = "data_collection_dag") %>% 
  dplyr::rename("hospital_record_id" = "record_id")


# Join with patient data ----
# Patient part

df_patient = patient_data %>% 
  dplyr::rename("patient_record_id" = "record_id")


# Examine for duplication before joining
#=======================================

# How many hospital data rows are missing the dag?

df_hospital %>% 
  select(redcap_data_access_group) %>% 
  mutate(dag_na = is.na(redcap_data_access_group)) %>% 
  count(dag_na)

df_patient %>% 
  select(redcap_data_access_group) %>% 
  mutate(dag_na = is.na(redcap_data_access_group)) %>% 
  count(dag_na)

# Cases of duplicated dags in the hospital data

duplicated_dag_hospital = df_hospital %>% 
  drop_na(redcap_data_access_group) %>% 
  group_by(redcap_data_access_group) %>% 
  mutate(ndag = n()) %>% 
  filter(ndag>1) %>% 
  ungroup() %>% 
  arrange(redcap_data_access_group) %>% 
  relocate(redcap_data_access_group)



master_data = left_join( 
  df_patient,
  df_hospital %>% distinct(redcap_data_access_group, .keep_all = T)
)
#save(joined_data, file = "06_joined_data_2025-07-18.rda")
rm(df_hospital, df_patient, hospital_data_ss, duplicated_dag_hospital, patient_data)
