# Re-opreation and Drain - as per branching logic, they must be No for the lower levels of CD
patient_data = patient_data %>% 
  mutate(postop30_cd_reop = if_else(postop30_cd %in% c("0 (no complications)","I", "II", "IIIa"),
                                    "No", postop30_cd_reop)) %>% 
  mutate(postop30_cd_drain = if_else(postop30_cd %in% c("0 (no complications)","I", "II"),
                                     "No", postop30_cd_drain))