library(tidyverse)
library(scales)
theme_set(theme_bw())
library(finalfit)

#load("patient_data_orig.rda")
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

stopifnot(n_distinct(checkbox_vars$record_id) == nrow(checkbox_vars))

# check that None only appears alone
# test = checkbox_vars %>% 
#   count(pt_comorbid, sort = TRUE) %>% 
#   mutate(includes_none = str_detect(pt_comorbid, "None"))



patient_data = patient_data_orig %>% 
  select(-contains("___")) %>% 
  left_join(checkbox_vars)
