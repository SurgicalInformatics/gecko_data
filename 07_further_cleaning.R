# Copied from argonaut - sivesh - gecko_data shared project

# get master data from pin
board = board_connect(server = "argoshare.is.ed.ac.uk")
master_data = pin_read(board, "nclark/joined_data") 

# Select Adult patients #
gecko_adult = master_data %>% 
  filter(age_years > 17) %>% 
  filter(internal_check == "Pass - included in analysis")


#gecko_adult %>% 
#  filter(age_years > 17) %>% 
#  select(wb, hosp_type,redcap_data_access_group_orig) %>% 
# group_by(wb, hosp_type) %>%
#  summarise(num_iso2 = n_distinct(redcap_data_access_group_orig), .groups = "drop")

# clean 
gecko_adult = gecko_adult %>%
  mutate(wb = fct_recode(wb, "Lower middle / Low income" = "Lower middle income", 
                            "Lower middle / Low income" = "Low income"),
         wb = finalfit::ff_label(wb, "Country income")) %>% 
  
  # dag
  mutate(redcap_data_access_group_v2 = redcap_data_access_group) %>% 
  
  # seperate hospital
  separate(redcap_data_access_group, into = c("country", "town", "hospital"), sep = "_") %>% 
  select(-country) %>% 
  mutate(hospital = as.factor(hospital)) %>% 
  mutate(iso2 = as.factor(iso2)) %>% 
  
  mutate(
    # hospital type ----
    hosp_type = fct_relevel(hosp_type, "Tertiary (teaching or university hospital)") %>% 
      ff_label("Hospital type"),
    
    hosp_type_2l = case_when(
      is.na(hosp_type) ~ NA,
      hosp_type == "Tertiary (teaching or university hospital)" ~ "No",
      TRUE ~ "Yes") %>% 
      ff_label("Proportion district hospitals"),
    .after = hosp_type) %>% 
  
  mutate(
    # service type ----
    service_type = fct_relevel(service_type, "Elective", "Emergency"),
         service_type = fct_recode(service_type, "Both"="Elective, Emergency"),
         service_type = finalfit::ff_label(service_type, "Type of surgical activity")) %>% 
  
  
  mutate(
    # hpb access ---
    hosp_hpb_region_2l = fct_collapse(hosp_hpb_region, "No" = c("None", "In another region", "In another city but in the same region"), 
                                           "Yes"="Within the same city"),
    
    hpb_access_2l = case_when(hosp_hpb == "No" ~ "No",
                              hosp_hpb_region_2l == "Yes" & hosp_hpb == "No" ~ "Yes",
                              hosp_hpb == "Yes" ~ "Yes") %>%
      fct_relevel("No") %>% 
      ff_label("On-site HPB services"),
    
    hosp_hpb = fct_relevel(hosp_hpb, "No"),
        ) %>%
  
  mutate(
    # hpb bdi pathway ---
    hosp_hpb_region_2l  %>% 
      ff_label("Dedicated BDI pathway")
    ) %>% 
  
  mutate(
    # mis availability in hospital ---
    hosp_mis_yn  %>% 
      ff_label("MIS available")
  ) %>% 
  
   mutate(
     # day unit access ----
     day_unit = fct_collapse(service_setting, "No"= c("Elective theatre","Elective theatre, Emergency theatre","Emergency theatre"),
                                 "Yes"=c("Day unit", "Day unit, Elective theatre","Day unit, Elective theatre, Emergency theatre",
                                         "Day unit, Emergency theatre")) %>% 
       fct_relevel("No") %>% 
       ff_label("Day case unit"),
     .after = service_setting) %>% 
  select(-service_setting) %>% 

   # Access to local simulaton
  mutate(train_sim_yn = fct_collapse(train_sim_yn, 
                                     "Yes" = c("Yes (Local hospital)",  "Yes (Local hospital), Yes (Regional)",
                                               "Yes (Local hospital), Yes (National)","Yes (Local hospital), Yes (Regional), Yes (National)"),
                                     "No" = c("No", "Yes (Regional)","Yes (National)","Yes (Regional), Yes (National)")),
         train_sim_yn = finalfit::ff_label(train_sim_yn, "Local simulation training facilities"),
         train_sim_lr = fct_collapse(train_sim_yn, 
                                     "Yes" = c("Yes (Local hospital)",  "Yes (Local hospital), Yes (Regional)",
                                               "Yes (Local hospital), Yes (National)","Yes (Local hospital), Yes (Regional), Yes (National)",
                                               "Yes (Regional)","Yes (Regional), Yes (National)"),
                                     "No" = c("No", "Yes (National)")),
         train_sim_lr = finalfit::ff_label(train_sim_lr, "Local simulation training facilities")) %>% 
  mutate(train_sim_yn = fct_relevel(train_sim_yn, "No","Yes - local","Yes - regional")) %>% 
  
  # Access to structured training
  mutate(tain_chole = as.factor(tain_chole)) %>%  
  mutate(tain_chole = fct_collapse(tain_chole,
                                   "Yes" = c("Yes (Local hospital)",  "Yes (Local hospital), Yes (Regional)",
                                             "Yes (Local hospital), Yes (National)","Yes (Local hospital), Yes (Regional), Yes (National)"),
                                   "No" = c("\tNo", "Yes (Regional)","Yes (National)","Yes (Regional), Yes (National)")),
         tain_chole = finalfit::ff_label(tain_chole, "Local structured choleystectomy training"),
         tain_chole_lr = fct_collapse(tain_chole,
                                      "Yes" = c("Yes (Local hospital)",  "Yes (Local hospital), Yes (Regional)",
                                                "Yes (Local hospital), Yes (National)","Yes (Local hospital), Yes (Regional), Yes (National)",
                                                "Yes (Regional)","Yes (Regional), Yes (National)"),
                                      "No" = c("\tNo","Yes (National)")),
         tain_chole_lr = finalfit::ff_label(tain_chole_lr, "Local structured choleystectomy training")) %>% 
  mutate(tain_chole = fct_relevel(tain_chole, "No","Yes - local","Yes - regional")) %>% 
  
  mutate(training = case_when(train_sim_yn == "No" &  tain_chole == "No" ~ "No",
                              train_sim_yn == "Yes" | tain_chole == "Yes" ~ "Yes"),
         training = fct_relevel(training, "No"),
         training = finalfit::ff_label(training, "Simulation facilities or training")) %>% 
  
  mutate(
    # hospital funding ----
    hosp_fund = fct_relevel(hosp_fund, "Public","Private") %>% 
      ff_label("Hospital funding"),
    
    hosp_fund_2l = case_when(
      is.na(hosp_fund) ~ NA,
      hosp_fund == "Public" ~ "Yes",
      TRUE ~ "No") %>%  
      factor() %>% 
      ff_label("Proportion public hospitals"),
    .after = hosp_fund) %>% 
  
  # number of consultants
  mutate(
    service_cons_n = fct_recode(service_cons_n, "100"="+100") %>% 
      as.numeric() %>% 
      ff_label("Number of consultants"),
    
    service_cons_lap_n %>%  
      as.numeric() %>% 
      ff_label("Number MIS surgeons")
    ) %>% 
  
  # diagnostic access on site
  mutate(diag_us_2l = fct_recode(diag_us_yn, "No"="Not available", "No"="Available off-site","Yes"="Available on-site"),
         diag_us_2l = fct_relevel(diag_us_2l, "No"),
         diag_ct_2l = fct_recode(diag_ct_yn, "No"="Not available", "No"="Available off-site","Yes"="Available on-site"),
         diag_ct_2l = fct_relevel(diag_ct_2l, "No"),
         diag_mrcp_2l = fct_recode(diag_mrcp_yn, "No"="Not available", "No"="Available off-site","Yes"="Available on-site"),
         diag_mrcp_2l = fct_relevel(diag_mrcp_2l, "No"),
         diag_eus_2l = fct_recode(diag_eus_yn, "No"="Not available", "No"="Available off-site","Yes"="Available on-site"),
         diag_eus_2l = fct_relevel(diag_eus_2l, "No"),
         diag_hida_2l = fct_recode(diag_hida_yn, "No"="Not available", "No"="Available off-site","Yes"="Available on-site"),
         diag_hida_2l = fct_relevel(diag_hida_2l, "No"),
         diag_ostomy_2l = fct_recode(diag_ostomy_yn, "No"="Not available", "No"="Available off-site","Yes"="Available on-site"),
         diag_ostomy_2l = fct_relevel(diag_ostomy_2l, "No"),
         diag_us_2l = finalfit::ff_label(diag_us_2l, "On-site US"),
         diag_ct_2l = finalfit::ff_label(diag_ct_2l, "On-site CT"),
         diag_mrcp_2l = finalfit::ff_label(diag_mrcp_2l, "On-site MRCP"),
         diag_hida_2l = finalfit::ff_label(diag_hida_2l, "On-site HIDA"),
         diag_eus_2l = finalfit::ff_label(diag_eus_2l, "On-site EUS"),
         diag_ostomy_2l = finalfit::ff_label(diag_ostomy_2l, "On-site Cholecystostomy")) %>% 

  
  #baseline
  mutate(
    # age ----
    age.groups = as.factor(age.groups),
         age.groups = finalfit::ff_label(age.groups, "Age, years")) %>% 
  
  mutate(
    # asa ----
    asa_3l = fct_collapse(asa, "III-V" = c("III","IV","V")),
         asa_3l = fct_relevel(asa_3l, "I","II"),
         asa_3l = finalfit::ff_label(asa_3l, "ASA grade"),
    
    asa = finalfit::ff_label(asa, "ASA grade"))  %>%
  
  # bmi
  mutate(bmi_4l = fct_collapse(bmi, ">30" = c("30.0-34.9", "35.0-39.9","40+","Unknown")),
         bmi_4l = fct_relevel(bmi_4l, "18.5-24.9","<18.5","25.0-29.9"),
         bmi_4l = finalfit::ff_label(bmi_4l, "Body Mass Index (BMI)")) %>%

  # check comorbidity
  mutate(
    mi = case_when(str_detect(pt_comorbid, "Myocardial") == T ~ "Yes", str_detect(pt_comorbid, "Myocardial") == F ~ "No"),
    chf = case_when(str_detect(pt_comorbid, "Congestive") == T ~ "Yes", str_detect(pt_comorbid, "Congestive") == F ~ "No"),
    pvd = case_when(str_detect(pt_comorbid, "Peripheral") == T ~ "Yes", str_detect(pt_comorbid, "Peripheral") == F ~ "No"),
    cvd = case_when(str_detect(pt_comorbid, "Cerebrovascular") == T ~ "Yes", str_detect(pt_comorbid, "Cerebrovascular") == F ~ "No"),
    dementia = case_when(str_detect(pt_comorbid, "Dementia") == T ~ "Yes", str_detect(pt_comorbid, "Dementia") == F ~ "No"),
    copd = case_when(str_detect(pt_comorbid, "COPD") == T ~ "Yes", str_detect(pt_comorbid, "COPD") == F ~ "No"),
    ctd = case_when(str_detect(pt_comorbid, "CTD") == T ~ "Yes", str_detect(pt_comorbid, "CTD") == F ~ "No"),
    pud = case_when(str_detect(pt_comorbid, "PUD") == T ~ "Yes", str_detect(pt_comorbid, "PUD") == F ~ "No"),
    hemiplegia = case_when(str_detect(pt_comorbid, "Hemiplegia") == T ~ "Yes", str_detect(pt_comorbid, "Hemiplegia") == F ~ "No"),
    leukaemia = case_when(str_detect(pt_comorbid, "Leukaemia") == T ~ "Yes", str_detect(pt_comorbid, "Leukaemia") == F ~ "No"),
    lymphoma = case_when(str_detect(pt_comorbid, "Lymphoma") == T ~ "Yes", str_detect(pt_comorbid, "Lymphoma") == F ~ "No"),
    hiv = case_when(str_detect(pt_comorbid, "HIV") == T ~ "Yes", str_detect(pt_comorbid, "HIV") == F ~ "No"),
    htn = case_when(str_detect(pt_comorbid, "Hypertension") == T ~ "Yes", str_detect(pt_comorbid, "Hypertension") == F ~ "No"),
    ibd = case_when(str_detect(pt_comorbid, "IBD") == T ~ "Yes", str_detect(pt_comorbid, "IBD") == F ~ "No"),
    dm = case_when(str_detect(pt_comorbid, "Diabetes") == T ~ "Yes", str_detect(pt_comorbid, "Diabetes") == F ~ "No"),
    cancer = case_when(str_detect(pt_comorbid, "Solid") == T ~ "Yes", str_detect(pt_comorbid, "Solid") == F ~ "No"),
    cld = case_when(str_detect(pt_comorbid, "Liver") == T ~ "Yes", str_detect(pt_comorbid, "Liver") == F ~ "No"),
    ckd = case_when(str_detect(pt_comorbid, "Kidney") == T ~ "Yes", str_detect(pt_comorbid, "Kidney") == F ~ "No")) %>% 
  
    # frailty
  mutate(frailty_3l = fct_collapse(frailty, 
                                   "1-3" = c("1 (Very fit)","2 (Well)","3 (Managing well)"),
                                   "4-6" = c("4 (Vulnerable)","5 (Mildly frail)","6 (Moderately frail)"),
                                   "7-9" = c("7 (Severely frail)","8 (Very severely frail)","9 (Terminally ill)"))) %>%
  
  #history
  mutate(hist_ac = fct_relevel(hist_ac, "No")) %>% 
  
  # pre_symp_t
  mutate(pre_symp_op_months = pre_symp_adm_months + pre_diag_dec_months + pre_dec_op_months)   %>% 

  mutate(
    # anaesthesia ---
    op_anaes_3l = fct_collapse(op_anaes, "Local" = c("Local"),
                                 "Regional" = c("Local, Regional","Local, Regional, Sedation", "Regional","Regional, Sedation", "Local, Sedation", "Sedation"),
                                 "General or TIVA" = c("General Inhaled", "General Inhaled, TIVA", "Local, General Inhaled", "Local, General Inhaled, TIVA", "Local, Regional, General Inhaled",
                                 "Local, Regional, General Inhaled, TIVA", "Local, Regional, TIVA", "Local, Sedation, General Inhaled", "Local, Sedation, General Inhaled, TIVA", 
                                 "Local, Sedation, TIVA", "Local, TIVA", "Regional, General Inhaled","Regional, General Inhaled, TIVA", "Regional, Sedation, General Inhaled",
                                 "Regional, TIVA", "Sedation, General Inhaled", "Sedation, General Inhaled, TIVA", "Sedation, TIVA","TIVA")) %>% 
          fct_relevel("Local","Regional") %>% 
          ff_label("Main mode of anaesthesia"),
    
    op_anaes.2l = case_when(is.na(op_anaes.grouped) ~ NA_character_,
                                 op_anaes.grouped == "General Inhaled" ~ "General (inhaled)",
                                 TRUE ~ "Other anaesthetic") %>% 
           factor() %>% 
           ff_label("Anaesthetic")) %>% 
    
  mutate(
    # primary operator ---
    op_operator_4l = case_when(
      str_detect(op_operator, "Consultant or attending") == T ~ "Consultant or attending",
      str_detect(op_operator, "Senior trainee") == T ~ "Senior trainee",
      str_detect(op_operator, "Junior trainee") == T ~ "Junior trainee",
      str_detect(op_operator, "Non-surgeon") == T ~ "Non-surgeon") %>% 
      
      factor() %>% 
      fct_relevel("Consultant or attending","Senior trainee", "Junior trainee") %>% 
      ff_label("Grade of primary operator"),
    
    op_operator_2l = fct_collapse(op_operator_4l, "Non-consultant" = c("Senior trainee", "Junior trainee","Non-surgeon")) %>%
      ff_label("Grade of primary operator"),
    
    op_operator_yn = case_when(is.na(op_operator_2l) ~ NA,
                               op_operator_2l == "Consultant or attending" ~ "Yes",
                               TRUE ~ "No") %>% 
      factor() %>% 
      ff_label("Consultant primary operator"),
  ) %>% 

  # trainee operation
  mutate(op_operator_trainee_op_2l = fct_collapse(op_operator_trainee_op, "No" = c("Unknown")),
         op_operator_trainee_op_2l = finalfit::ff_label(op_operator_trainee_op_2l, "Training operation")) %>% 
  
  mutate(
    # urgency ---
    pre_urgency_2l = fct_collapse(pre_urgency, 
                                     "Emergency" = c("Delayed")) %>% 
      ff_label("Urgency"),
    
    pre_urgency_yn = case_when(is.na(pre_urgency_2l) ~ NA,
                               pre_urgency_2l == "Emergency" ~ "Yes",
                               TRUE ~ "No") %>% 
      factor() %>% 
      ff_label("Emergency rates")
    ) %>% 
  
  # approach_3l
  mutate() %>% 
  mutate(
    # operative appraoch ---
    op_approach_3l = fct_collapse(op_approach, 
                                  "MIS" = c("Laparoscopic", "Robotic")),
    
    op_approach_2l = fct_collapse(op_approach,
                                  "MIS" = c("Open conversion","Laparoscopic", "Robotic")),
    
    op_approach_yn = case_when(is.na(op_approach_2l) ~ NA,
                               op_approach_2l == "MIS" ~ "Yes",
                               TRUE ~ "No") %>% 
      factor() %>% 
      ff_label("MIS performed")
    ) %>% 
  
  #contamination
  mutate(op_contam_3l = fct_collapse(op_contam, "Clean-Contaminated"="Clean"),
         op_contam_3l = finalfit::ff_label(op_contam_3l, "Operative contamination")) %>% 
  
  # critical view of safety
  mutate(op_cvs_2l = fct_recode(op_cvs_yn, "No" = "No (CVS documented as not obtained)", "No"="CVS not documented", "Yes" = "Yes (CVS documented as obtained)"),
         op_cvs_2l = finalfit::ff_label(op_cvs_2l, "Critical view of safety obtained")) %>% 
  
  # day_case 
  mutate(day_case = fct_collapse(post30_los.groups, "No" = c("1","2-3","5-10","10+"),
                                 "Yes"=c("0")),
         day_case = finalfit::ff_label(day_case, "Day case surgery")) %>% 
  
  # gowns and drapes 
  mutate(gown_drape_3l = case_when(op_reuse_gown == "No" & op_reuse_drape == "No"  ~ "All disposable",
                                   op_reuse_gown == "Yes {op_reuse_gown_usage}" & op_reuse_drape == "Yes" ~ "All resusable",
                                   op_reuse_gown == "Yes {op_reuse_gown_usage}" & op_reuse_drape == "No" ~ "Mixed",
                                   op_reuse_gown == "No" & op_reuse_drape == "Yes" ~ "Mixed",
                                   op_reuse_gown == "Unknown" | op_reuse_drape == "Unknown" ~ "Unknown",
                                   is.na(op_reuse_gown) | is.na(op_reuse_drape) ~ "Unknown"),
         gown_drape_3l = finalfit::ff_label(gown_drape_3l, "Type of gowns and drapes")) %>% 

  
  # new CD to recheck CD grade
  # postop30_cd -> 0 (no complications) | 2, I | 3, II | 4, IIIa | 5, IIIb | 6, IVa | 7, IVb | 8, V (death)
  # postop30_comp_ssi-> 0 (no complications) | 2, I | 3, II | 4, IIIa | 5, IIIb | 6, IVa | 7, IVb | 8, V (death)
  # postop30_comp_ppc-> 0 (no complications) | 2, I | 3, II | 4, IIIa | 5, IIIb | 6, IVa | 7, IVb | 8, V (death)
  # postop30_comp_leak-> 0 (no complications) | 2, I | 3, II | 4, IIIa | 5, IIIb | 6, IVa | 7, IVb | 8, V (death)
  # postop30_comp_bleed-> 0 (no complications) | 2, I | 3, II | 4, IIIa | 5, IIIb | 6, IVa | 7, IVb | 8, V (death)
  # postop30_comp_collec-> 0 (no complications) | 2, I | 3, II | 4, IIIa | 5, IIIb | 6, IVa | 7, IVb | 8, V (death)
  # postop30_comp_ap-> 0 (no complications) | 2, I | 3, II | 4, IIIa | 5, IIIb | 6, IVa | 7, IVb | 8, V (death)
  # postop30_cd_drain -> no / yes
  # postop30_cd_reop -> no / yes
# postop30_cc_yn -> no / yes
# postop30_reimg -> no / yes

mutate(
  # any complications (master) ----
  postop30_cd_recode = case_when(
  # CD V
  postop30_cd == "V (death)" |  postop30_comp_ssi == "V (death)" | postop30_comp_ppc == "V (death)" | postop30_comp_leak == "V (death)" |
    postop30_comp_bleed == "V (death)" | postop30_comp_collec == "V (death)" | postop30_comp_ap == "V (death)" ~ "V (death)",
  
  # CD IVb
  postop30_cd == "IVb" |  postop30_comp_ssi == "IVb" | postop30_comp_ppc == "IVb" | postop30_comp_leak == "IVb" | postop30_comp_bleed == "IVb" | 
    postop30_comp_collec == "IVb" | postop30_comp_ap == "IVb" ~ "IVb",
  
  # CD IVa
  postop30_cd == "IVa" |  postop30_comp_ssi == "IVa" | postop30_comp_ppc == "IVa" | postop30_comp_leak == "IVa" | postop30_comp_bleed == "IVa" | 
    postop30_comp_collec == "IVa" | postop30_comp_ap == "IVa" | postop30_cc_yn == "Yes"~ "IVa",
  
  # CD IIIb
  postop30_cd == "IIIb" |  postop30_comp_ssi == "IIIb" | postop30_comp_ppc == "IIIb" | postop30_comp_leak == "IIIb" | postop30_comp_bleed == "IIIb" | 
    postop30_comp_collec == "IIIb" | postop30_comp_ap == "IIIb" | postop30_cc_yn == "Yes" ~ "IIIb",
  
  # CD IIIa
  postop30_cd == "IIIa" |  postop30_comp_ssi == "IIIa" | postop30_comp_ppc == "IIIa" | postop30_comp_leak == "IIIa" | postop30_comp_bleed == "IIIa" | 
    postop30_comp_collec == "IIIa" | postop30_comp_ap == "IIIa" | postop30_cd_drain == "Yes"~ "IIIa",
  
  # CD II
  postop30_cd == "II" |  postop30_comp_ssi == "II" | postop30_comp_ppc == "II" | postop30_comp_leak == "II" | postop30_comp_bleed == "II" | 
    postop30_comp_collec == "II" | postop30_comp_ap == "II" ~ "II",
  
  # CD I
  postop30_cd == "I" |  postop30_comp_ssi == "I" | postop30_comp_ppc == "I" | postop30_comp_leak == "I" | postop30_comp_bleed == "I" | 
    postop30_comp_collec == "I" | postop30_comp_ap == "I" ~ "I",
  
  # CD 0
  postop30_cd == "0 (no complications)" |  postop30_comp_ssi == "0 (no complications)" | postop30_comp_ppc == "0 (no complications)" | 
    postop30_comp_leak == "0 (no complications)" | postop30_comp_bleed == "II" | 
    postop30_comp_collec == "0 (no complications)" | postop30_comp_ap == "0 (no complications)" ~ "0 (no complications)",
  
  # NA
  is.na(postop30_cd) | is.na(postop30_comp_ssi) | is.na(postop30_comp_ppc) | is.na(postop30_comp_leak) | is.na(postop30_comp_bleed) | is.na(postop30_comp_collec) |
    is.na(postop30_comp_ap) | is.na(postop30_cc_yn) | is.na(postop30_cd_reop) | is.na(postop30_cd_drain) ~ "0 (no complications)"),
  
  # defined as yes / no
  comps_any_2l = fct_collapse(postop30_cd_recode,
                                       "No" = "0 (no complications)",
                                       "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)")) %>%
    ff_label("Any complications"),
  
  # defined as none, minor and major
  comps_any_3l = fct_collapse(postop30_cd_recode,
                              "No" = "0 (no complications)", 
                              "Minor" = c("I","II"), 
                              "Major" = c("IIIa","IIIb","IVa","IVb","V (death)")) %>%
    ff_label("Any complications"),
  
  comps_minor_2l = fct_collapse(postop30_cd_recode,
                                     "No" = c("0 (no complications)","IIIa","IIIb","IVa","IVb","V (death)") ,
                                     "Yes" = c("I","II")) %>%
    ff_label("Minor complications"),
  
  comps_major_2l = fct_collapse(postop30_cd_recode,
                                "No" = c("0 (no complications)","I","II"), 
                                "Yes" = c("IIIa","IIIb","IVa","IVb","V (death)")) %>%
    ff_label("Major complications")) %>% 
  
  mutate(
    # ssi ----
    postop_ssi_2l = fct_collapse(postop30_comp_ssi,"No" = "0 (no complication)",
                                      "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)")),
    
    postop_ssi_3l = fct_collapse(postop30_comp_ssi,
                                 "No" = "0 (no complication)", "Minor" = c("I","II"), 
                                 "Major" = c("IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  
  mutate(postop_ppc_2l = fct_collapse(postop30_comp_ppc,
                                      "No" = "0 (no complication)",
                                      "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_ppc_3l = fct_collapse(postop30_comp_ppc, 
                                      "No" = "0 (no complication)", "Minor" = c("I","II"), "Major" = c("IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_leak_2l = fct_collapse(postop30_comp_leak,
                                       "No" = "0 (no complication)",
                                       "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_leak_3l = fct_collapse(postop30_comp_leak, 
                                       "No" = "0 (no complication)", "Minor" = c("I","II"), "Major" = c("IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_bleed_2l = fct_collapse(postop30_comp_bleed,
                                        "No" = "0 (no complication)",
                                        "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_bleed_3l = fct_collapse(postop30_comp_bleed, 
                                        "No" = "0 (no complications)", "Minor" = c("I","II"), "Major" = c("IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_collec_2l = fct_collapse(postop30_comp_collec,
                                         "No" = "0 (no complication)",
                                         "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_collec_3l = fct_collapse(postop30_comp_collec, 
                                         "No" = "0 (no complications)", "Minor" = c("I","II"), "Major" = c("IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_ap_2l = fct_collapse(postop30_comp_ap,
                                     "No" = "0 (no complication)",
                                     "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(postop_ap_3l = fct_collapse(postop30_comp_ap,
                                     "No" = "0 (no complications)",
                                     "Yes" = c("I","II","IIIa","IIIb","IVa","IVb","V (death)"))) %>% 
  mutate(
    # bile duct injury (30-day) ----
    bdi_yn = if_else(is.na(bdi_yn), "No", bdi_yn) %>% 
      ff_label("Bile duct injury")) %>% 
  
  mutate(
    # procedure-specific complications (30-day)  ----
    comps_chole_2l = case_when(
      postop_leak_2l == "Yes" | 
        postop_bleed_2l == "Yes" |  
        postop_collec_2l == "Yes" | 
        postop_ap_2l =="Yes" | 
        bdi_yn == "Yes" | 
        postop30_cd_recode %in% c("IIIa", "IIIb", "IVa", "IVb", "V (death)") |
        
        ## Additions
        comps_major_2l == "Yes" ~ "Yes",
      TRUE ~ "No") %>% 
        factor() %>% 
        ff_label("Procedure-specific complications")) %>% 

  # label 
  mutate(hosp_hpb = finalfit::ff_label(hosp_hpb, "Presence of HPB team"),
         op_operator_n = finalfit::ff_label(op_operator_n, "Number of cholecystectomy done by operator"),
         frailty_3l = finalfit::ff_label(frailty_3l, "Clinical frailty"))

# write to pins 
#board = pins::board_connect()
#board = pins::board_connect(server = "argoshare.is.ed.ac.uk") %>%  pins::pin_write(gecko_adult, name = "siveshkk93/gecko_adult_data")

rm(board)
rm(master_data)
