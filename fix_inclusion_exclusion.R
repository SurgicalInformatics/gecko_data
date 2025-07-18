# User's were allowed to edit the inclusion-exclusion variable at 1-year follow-up
# I've now created two separte variables to note the state of consent in the original data collection period
# And then how it was changed at 1 year on
# Riinu Pius 2025-04-30

library(tidyverse)
library(scales)
theme_set(theme_bw())

load("data_raw/gecko_redcap_pull_2024-03-06.rda")

gecko_initial = patient_data_orig %>% 
  select(record_id, inclusion_exclusion)

gecko_initial %>% 
  count(inclusion_exclusion)

gecko_fu <- list("token"=Sys.getenv("gecko_data_collection_token"),
                          content='report',
                          action='export',
                          format='csv',
                          type='flat',
                          csvDelimiter='',
                          report_id= 543,
                          rawOrLabel='raw',
                          rawOrLabelHeaders='raw',
                          exportCheckboxLabel='false',
                          exportSurveyFields='false',
                          exportDataAccessGroups='false',
                          returnFormat='json') %>%
  httr::POST(Sys.getenv("redcap_globalsurg_uri"), body = ., encode = "form") %>%
  httr::content(guess_max = Inf)

exclude_fu = gecko_fu %>% 
  filter(inclusion_exclusion > 1)

include_fu = gecko_fu %>% 
  filter(inclusion_exclusion == 1 | is.na(inclusion_exclusion))

no_longer_included = gecko_initial %>% 
  filter(record_id %in% exclude_fu$record_id) %>% 
  left_join(gecko_fu, by = "record_id") %>% 
  rename(inclusion_exclusion = inclusion_exclusion.x, inclusion_exclusion_fu = inclusion_exclusion.y) %>% 
  mutate(url = glue::glue("<a href='https://redcap.globalsurg.org/redcap_v15.4.2/DataEntry/index.php?pid=90&page=include_or_exclude_record&id={record_id}&event_id=294' target='_blank'>Link</a>"))

DT::datatable(no_longer_included,escape = FALSE)

# have reversed the 8 now_included by hand - Riinu 18/07/2025
# now_included = include_fu %>% 
#   filter(! record_id %in% gecko_initial$record_id)

no_longer_included %>% 
  select(-url) %>% 
  write_csv("set_1year_fu_inclusion.csv", na = "")
