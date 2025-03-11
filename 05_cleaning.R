# comment these three lines in if working on this script specifically
# comment back out when running whole pipeline again
# library(tidyverse)
# library(finalfit)
# load("04_cut_collapse.rda")

labels_keep = extract_variable_label(patient_data)

# check for duplicates ----
# haven't removed them yet, just exploring/deciding how and where best to
duplicated = patient_data %>% 
  janitor::get_dupes(redcap_data_access_group,
                     period, age_years, gender, bmi, frailty,
                     asa, pt_comorbid, hist_ac, admission_prior,
                     pre_diag_dec_day,
                     pre_symp_adm_day,
                     pre_dec_op_day,
                     op_nassar,
                     hist_result_day,
                     pre_img_finding)

# Re-operation and Drain ----
# as per branching logic, they must be No for the lower levels of CD:
patient_data = patient_data %>% 
  mutate(postop30_cd_reop = if_else(postop30_cd %in% c("0 (no complications)","I", "II", "IIIa"),
                                    "No", postop30_cd_reop)) %>% 
  mutate(postop30_cd_drain = if_else(postop30_cd %in% c("0 (no complications)","I", "II"),
                                     "No", postop30_cd_drain)) %>% 
  ff_relabel(labels_keep)


