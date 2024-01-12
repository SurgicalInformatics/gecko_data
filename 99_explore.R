library(tidyverse)
library(scales)
theme_set(theme_bw())

load("patient_data_orig.rda")

patient_data_orig %>% 
  count(postop30_cd, postop30_comp_ssi)
