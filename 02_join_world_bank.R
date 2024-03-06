wb = read_csv("world_bank_classifications2024.csv", na = "") %>% 
  mutate(wb = fct_relevel(wb, "High income", "Upper middle income", "Lower middle income")) %>% 
  select(iso2, wb)

n_records0 = n_distinct(patient_data_orig$record_id)

patient_data_orig = patient_data_orig %>% 
  mutate(iso2 = toupper(str_sub(redcap_data_access_group, 1, 2))) %>% 
  left_join(wb) %>% 
  mutate(wb = ff_label(wb, "WB income level")) %>% 
  relocate(c(iso2, wb), .after = redcap_data_access_group)

n_records1 = n_distinct(patient_data_orig$record_id)
stopifnot(n_records0 == n_records1)
stopifnot(nrow(drop_na(wb)) == nrow(wb))
rm(wb, n_records0, n_records1)
