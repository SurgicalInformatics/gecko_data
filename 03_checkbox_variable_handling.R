library(tidyverse)
library(scales)
theme_set(theme_bw())
library(finalfit)

labels_keep = extract_variable_label(patient_data_orig)

checkbox_vars_orig = patient_data_orig %>% 
  select(record_id, contains("___"))

labels_df = tibble(name = names(labels_keep),
                   label = labels_keep)

checkbox_vars = checkbox_vars_orig %>% 
  pivot_longer(-record_id) %>% 
  filter(value == "Checked") %>% 
  left_join(labels_df) %>% 
  # using separate ro remove ___1, ___2, etc: 
  # just because it's easier than regexp
  separate(name, into = c("name", NA), sep = "___") %>% 
  summarise(.by = c(record_id, name),
            values = paste(label, collapse = ", ")) %>% 
  pivot_wider(names_from = name, values_from = values)

# check that record_id remains distinct (so no duplicated created in join)
stopifnot(n_distinct(checkbox_vars$record_id) == nrow(checkbox_vars))

# check that None only appears alone
stopifnot(
  checkbox_vars %>%
    count(pt_comorbid, sort = TRUE) %>%
    filter(str_detect(pt_comorbid, "None")) %>% 
    nrow() == 1)



patient_data = patient_data_orig %>% 
  select(-contains("___")) %>% 
  left_join(checkbox_vars)

var_order = labels_df %>% 
  mutate(label = if_else(str_detect(name, "___"), NA, label)) %>% 
  separate(name, into = c("name", NA), sep = "___", fill = "right") %>% 
  distinct()

# check that we've not changed the number and names of variables in this script:
stopifnot(all(var_order$name %in% names(patient_data)))
stopifnot(all(names(patient_data) %in% var_order$name))
stopifnot(nrow(var_order) == ncol(patient_data))


patient_data = patient_data %>% 
  select(all_of(var_order$name)) %>% 
  mutate(pt_comorbid         = ff_label(pt_comorbid        , "Comorbidities"),
         pre_img_finding     = ff_label(pre_img_finding    , "Preoperative imaging findings"),
         op_anaes            = ff_label(op_anaes           , "Mode of anaesthesia"),
         op_anaes_local      = ff_label(op_anaes_local     , "Local anaesthesia"),
         op_cvs_elements     = ff_label(op_cvs_elements    , "Elements of CSV achieved"),
         op_img              = ff_label(op_img             , "Intraoperative CBD Assessment"),
         op_comp             = ff_label(op_comp            , "Intraoperative complications (excl. BDI)"),
         postop30_reimg_type = ff_label(postop30_reimg_type, "Re-imaging type"),
         bdi_img             = ff_label(bdi_img            , "Imaging modality for BDI"),
         bdi_mx              = ff_label(bdi_mx             , "Management of BDI"),
         bdi_repair_comp     = ff_label(bdi_repair_comp    , "One-year complications post BDI surgical repair"),
         hist_staging        = ff_label(hist_staging       , "Staging investigations after index cholecystectomy"),
         hist_adjv           = ff_label(hist_adjv          , "Adjuvant treatment"),
         hist_rev_surg_type  = ff_label(hist_rev_surg_type , "Revisional surgery type"))

rm(checkbox_vars_orig, checkbox_vars, checkbox_labels, labels_df, var_order, labels_keep)
#save(patient_data, file = "03_patient_data.rda")
