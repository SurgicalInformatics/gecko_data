# library(tidyverse)
# library(finalfit)
# load("03_patient_data.rda")

labels_keep = extract_variable_label(patient_data)

patient_data = patient_data %>% 
  #select(-redcap_data_access_group) %>% 
  mutate(ALL = factor("ALL"), .after = 1) %>% 
  mutate(
    # co-morbidities ----
    # these are separated by comma, listed within a single cell.
    # so counting commas gives us total number.
    # Have checked that no individual comorbidities have
    # commas within themselves.
    comorb_n = if_else(pt_comorbid == "None",
                       0,
                       str_count(pt_comorbid, ",") + 1) %>% 
      ff_label("Number of comorbidities"),
    comorb_n.groups = case_when(comorb_n == 0 ~ "None",
                                comorb_n == 1 ~ "1",
                                comorb_n == 2 ~ "2",
                                comorb_n > 2  ~ "3+",
                                .default = NA) %>% 
      ff_label("Number of comorbidities"),
    .after = pt_comorbid) %>% 
  mutate(
    # age ----
    # parse_number(as.character()) is a bit stupid, but the column keeps flipping between
    # character and numeric based on whether people enter new mistakes/fix them on REDCap
    age_years = parse_number(as.character(age_years)),
    age.groups = case_when(between(age_years, 18, 30) ~ "18-30",
                           between(age_years, 31, 50) ~ "31-50",
                           between(age_years, 51, 70) ~ "51-70",
                           between(age_years, 71, 120) ~ "71+",
                           TRUE ~ NA) %>% 
      ff_label("Age"),
    .after = age_years) %>% 
  mutate(
    # n admissions ----
    admission_prior = parse_number(as.character(admission_prior)),
    admission_prior.groups = case_when(admission_prior == 0 ~ "None",
                                       between(admission_prior, 1, 1) ~ "1",
                                       between(admission_prior, 2, 3) ~ "2-3",
                                       between(admission_prior, 5, 10) ~ "5-10",
                                       between(admission_prior, 11, 10000) ~ "10+",
                                       TRUE ~ NA) %>% 
      fct_relevel("None", "1", "2-3", "5-10", "10+") %>% 
      ff_label("Prior admissions"),
    .after = admission_prior) %>% 
  mutate(
    # LOS ----
    post30_los = parse_number(as.character(post30_los)),
    post30_los.groups = case_when(post30_los == 0 ~ "0",
                                  between(post30_los, 1, 1) ~ "1",
                                  between(post30_los, 2, 3) ~ "2-3",
                                  between(post30_los, 5, 10) ~ "5-10",
                                  between(post30_los, 11, 10000) ~ "10+",
                                  TRUE ~ NA) %>%
      fct_relevel("0", "1", "2-3", "5-10", "10+") %>% 
      ff_label("Length of Stay (days)"),
    .after = post30_los) %>% 
  mutate(
    # symptom onset diagnosis ----
    pre_symp_adm_day = parse_number(as.character(pre_symp_adm_day)),
    pre_symp_adm_day.groups = case_when(pre_symp_adm_day == 0 ~ "0 days",
                                        between(pre_symp_adm_day, 1, 2) ~ "1-2 days",
                                        between(pre_symp_adm_day, 3, 7) ~ "3-7 days",
                                        between(pre_symp_adm_day, 8, 14) ~ "1-2 weeks",
                                        between(pre_symp_adm_day, 15, 28) ~ "2-4 weeks",
                                        between(pre_symp_adm_day, 29, 182) ~ "1-6 months",
                                        between(pre_symp_adm_day, 182, 10000000) ~ "6+ months",
                                        TRUE ~ NA) %>%
      fct_relevel("0 days", "1-2 days", "3-7 days", "1-2 weeks", "2-4 weeks", "1-6 months", "6+ months") %>% 
      ff_label("Symptom onset vs diagnosis (days)"),
    .after = pre_symp_adm_day) %>% 
  mutate(
    # diagnosis vs decision to operate ----
    pre_diag_dec_day = parse_number(as.character(pre_diag_dec_day)),
    pre_diag_dec_day.groups = case_when(pre_diag_dec_day == 0 ~ "0 days",
                                        between(pre_diag_dec_day, 1, 2) ~ "1-2 days",
                                        between(pre_diag_dec_day, 3, 7) ~ "3-7 days",
                                        between(pre_diag_dec_day, 8, 14) ~ "1-2 weeks",
                                        between(pre_diag_dec_day, 15, 28) ~ "2-4 weeks",
                                        between(pre_diag_dec_day, 29, 182) ~ "1-6 months",
                                        between(pre_diag_dec_day, 182, 10000000) ~ "6+ months",
                                        TRUE ~ NA) %>%
      fct_relevel("0 days", "1-2 days", "3-7 days", "1-2 weeks", "2-4 weeks", "1-6 months", "6+ months") %>% 
      ff_label("Diagnosis vs decision to operate (days)"),
    .after = pre_diag_dec_day) %>% 
  mutate(
    # decision to operate vs operation ----
    pre_dec_op_day = parse_number(as.character(pre_dec_op_day)),
    pre_dec_op_day.groups = case_when(pre_dec_op_day == 0 ~ "0 days",
                                      between(pre_dec_op_day, 1, 2) ~ "1-2 days",
                                      between(pre_dec_op_day, 3, 7) ~ "3-7 days",
                                      between(pre_dec_op_day, 8, 14) ~ "1-2 weeks",
                                      between(pre_dec_op_day, 15, 28) ~ "2-4 weeks",
                                      between(pre_dec_op_day, 29, 182) ~ "1-6 months",
                                      between(pre_dec_op_day, 182, 10000000) ~ "6+ months",
                                      TRUE ~ NA) %>%
      fct_relevel("0 days", "1-2 days", "3-7 days", "1-2 weeks", "2-4 weeks", "1-6 months", "6+ months") %>% 
      ff_label("Decision to operate vs operation (days)"),
    .after = pre_dec_op_day) %>% 
  mutate(
    # anaesthetic type ----
    op_anaes.grouped = op_anaes %>% 
      fct_lump(9, other_level = "Other combination") %>% 
      ff_label("Anaesthetic"),
    .after = op_anaes) %>% 
  ff_relabel(labels_keep)
