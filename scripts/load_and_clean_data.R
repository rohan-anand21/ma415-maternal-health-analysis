library(tidyverse)
library(dplyr)

loan_data <- read_csv(here::here("dataset-ignore", "nat2021us.csv"), n_max = 10000, show_col_types = FALSE)
options(max.print = 255) 
loan_data

## CLEAN the data
columns_to_remove <- c(
  "mage_impflg", "mar_p", "fhisp_r", "mage_repflg", "mager14", "mager9", "f_mar_p", "mraceimp", 
  "f_meduc", "fagecomb", "frace6", "fhisp_r", "mhisp_r", "mracehisp", "f_fhisp", 
  "mar_imp", "f_meduc", "f_mpcb", "f_tpcv", "f_cigs_0", "f_cigs_1", "f_cigs_2",
  "f_cigs_3", "f_tobaco", "f_m_ht", "f_rf_gdiab", "f_rf_phyper", "f_rf_ghyper", 
  "f_rf_eclamp", "f_rf_ppb", "cig_0", "cig_1", "cig_2", "cig_3", "f_apgar5", "f_ab_vent", "f_ab_vent6", 
  "f_ab_surfac", "f_ab_antibio", "f_ab_seiz", "f_ca_anen", "f_ca_menin", 
  "f_ca_heart", "f_ca_hernia", "f_ca_ompha", "f_ca_gastro", "f_ca_limb", "f_ca_cleftlp", 
  "f_ca_cleft", "f_ca_downs", "f_ca_chrom"
)
loan_data <- select(loan_data, -all_of(columns_to_remove))
