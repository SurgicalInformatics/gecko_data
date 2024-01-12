patient_data = patient_data_orig %>% 
  select(-redcap_data_access_group) %>% 
  mutate(ALL = factor("ALL"), .after = 1) %>% 
  mutate(
    # age ----
    # parse_number(as.character( is a bit stupid, but the column keeps flipping between
    # character and numeric based on whether people enter new mistakes/fix them on REDCap
    age_years = parse_number(as.character(age_years)),
    age.groups = case_when(age_years < 18 ~ "Missing",
                           between(age_years, 18, 30) ~ "18-30",
                           between(age_years, 31, 50) ~ "31-50",
                           between(age_years, 51, 70) ~ "51-70",
                           between(age_years, 71, 120) ~ "71+",
                           TRUE ~ "Missing") %>% 
      ff_label("Age"),
    # n admissions ----
    admission_prior = parse_number(as.character(admission_prior)),
    admission_prior.groups = case_when(admission_prior == 0 ~ "None",
                                       between(admission_prior, 1, 1) ~ "1",
                                       between(admission_prior, 2, 3) ~ "2-3",
                                       between(admission_prior, 5, 10) ~ "5-10",
                                       between(admission_prior, 11, 10000) ~ "10+",
                                       TRUE ~ "Missing") %>% 
      fct_relevel("None", "1", "2-3", "5-10", "10+") %>% 
      ff_label("Prior admissions"),
    # LOS ----
    post30_los = parse_number(as.character(post30_los)),
    post30_los.groups = case_when(post30_los == 0 ~ "0",
                                  between(post30_los, 1, 1) ~ "1",
                                  between(post30_los, 2, 3) ~ "2-3",
                                  between(post30_los, 5, 10) ~ "5-10",
                                  between(post30_los, 11, 10000) ~ "10+",
                                  TRUE ~ "Missing") %>%
      fct_relevel("0", "1", "2-3", "5-10", "10+") %>% 
      ff_label("Length of Stay (days)"),
    # symptom onset diagnosis ----
    pre_symp_adm_day = parse_number(as.character(pre_symp_adm_day)),
    pre_symp_adm_day.groups = case_when(pre_symp_adm_day == 0 ~ "0 days",
                                        between(pre_symp_adm_day, 1, 2) ~ "1-2 days",
                                        between(pre_symp_adm_day, 3, 7) ~ "3-7 days",
                                        between(pre_symp_adm_day, 8, 14) ~ "1-2 weeks",
                                        between(pre_symp_adm_day, 15, 28) ~ "2-4 weeks",
                                        between(pre_symp_adm_day, 29, 182) ~ "1-6 months",
                                        between(pre_symp_adm_day, 182, 10000000) ~ "6+ months",
                                        TRUE ~ "Missing") %>%
      fct_relevel("0 days", "1-2 days", "3-7 days", "1-2 weeks", "2-4 weeks", "1-6 months", "6+ months") %>% 
      ff_label("Symptom onset vs diagnosis (days)"),
    # diagnosis vs decision to operate ----
    pre_diag_dec_day = parse_number(as.character(pre_diag_dec_day)),
    pre_diag_dec_day.groups = case_when(pre_diag_dec_day == 0 ~ "0 days",
                                        between(pre_diag_dec_day, 1, 2) ~ "1-2 days",
                                        between(pre_diag_dec_day, 3, 7) ~ "3-7 days",
                                        between(pre_diag_dec_day, 8, 14) ~ "1-2 weeks",
                                        between(pre_diag_dec_day, 15, 28) ~ "2-4 weeks",
                                        between(pre_diag_dec_day, 29, 182) ~ "1-6 months",
                                        between(pre_diag_dec_day, 182, 10000000) ~ "6+ months",
                                        TRUE ~ "Missing") %>%
      fct_relevel("0 days", "1-2 days", "3-7 days", "1-2 weeks", "2-4 weeks", "1-6 months", "6+ months") %>% 
      ff_label("Diagnosis vs decision to operate (days)"),
    # decision to operate vs operation ----
    pre_dec_op_day = parse_number(as.character(pre_dec_op_day)),
    pre_dec_op_day.groups = case_when(pre_dec_op_day == 0 ~ "0 days",
                                      between(pre_dec_op_day, 1, 2) ~ "1-2 days",
                                      between(pre_dec_op_day, 3, 7) ~ "3-7 days",
                                      between(pre_dec_op_day, 8, 14) ~ "1-2 weeks",
                                      between(pre_dec_op_day, 15, 28) ~ "2-4 weeks",
                                      between(pre_dec_op_day, 29, 182) ~ "1-6 months",
                                      between(pre_dec_op_day, 182, 10000000) ~ "6+ months",
                                      TRUE ~ "Missing") %>%
      fct_relevel("0 days", "1-2 days", "3-7 days", "1-2 weeks", "2-4 weeks", "1-6 months", "6+ months") %>% 
      ff_label("Decision to operate vs operation (days)"),
    # anaesthetic type ----
    op_anaes.grouped = op_anaes %>% 
      str_replace("Total Intravenous Volatile Anaesthetic \\(TIVA\\)", "TIVA") %>% 
      str_remove(" \\(e.g., midazolam\\)") %>% 
      fct_na_value_to_level(level = "Missing") %>% 
      fct_lump(8, other_level = "Other") %>% 
      ff_label("Anaesthetic")
    # end ----
  ) %>% 
  ff_relabel(labels_keep)
