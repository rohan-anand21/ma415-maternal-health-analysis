#import libraries
library(tidyverse)

##Read data
#read csv data into variable
natality_csv <- read_csv(here::here('dataset-ignore','nat2021us.csv'), n_max = 10000, show_col_types = FALSE)

#save it as an rds file
saveRDS(natality_csv, here::here('dataset-ignore', 'natality_rds.rds'))

#load rds file
natality_rds = readRDS(here::here('dataset-ignore','natality_rds.rds'))


## CLEAN the data
#remove unnecessary columns
columns_to_remove <- c("mage_impflg", 'lmpused', 'obgest_flg', 'compgst_imp', 'imp_sex', 'fagerpt_flg', 'imp_plur', "mar_p", "fhisp_r", "mage_repflg", "mager14", "mager9", "f_mar_p", "mraceimp",   "f_meduc", "fagecomb", "frace6", "fhisp_r", "mhisp_r", "mracehisp", "f_fhisp",   "mar_imp", "f_meduc", "f_mpcb", "f_tpcv", "f_cigs_0", "f_cigs_1", "f_cigs_2",   "f_cigs_3", "f_tobaco", "f_m_ht", "f_rf_gdiab", "f_rf_phyper", "f_rf_ghyper",   "f_rf_eclamp", "f_rf_ppb", "cig_0", "cig_1", "cig_2", "cig_3", "f_apgar5", "f_ab_vent", "f_ab_vent6",   "f_ab_surfac", "f_ab_antibio", "f_ab_seiz", "f_ca_anen", "f_ca_menin",   "f_ca_heart", "f_ca_hernia", "f_ca_ompha", "f_ca_gastro", "f_ca_limb", "f_ca_cleftlp",   "f_ca_cleft", "f_ca_downs", "f_ca_chrom")
natality_data_cleaned <- natality_rds |>
  select(-all_of(columns_to_remove))


#tibble with number of NAs per column
number_of_nas <- natality_data_cleaned |>
  summarize(across(everything(), ~ sum(is.na(.))) ) |>
  pivot_longer(everything(), names_to = "Column", values_to = "NAs")

#recode columns: birth month, birth time
renamed_cols = c('dob_tt', 'dob_mm')

natality_data_cleaned <- natality_data_cleaned |>
  mutate(birth_month = factor(month.name[dob_mm], levels = month.name)) |>
  mutate(time_of_birth = sprintf("%04d", dob_tt),
         time_of_birth = sub("^(..)(..)$", "\\1:\\2", time_of_birth), 
         time_of_birth = as.character(time_of_birth)) |>
  select(-all_of(renamed_cols))


#create cleaned csv with values
write_csv(natality_data_cleaned, file = here::here("dataset-ignore", "natality_data_cleaned.csv"))

#save data as R file
save(natality_data_cleaned, file = here::here("dataset-ignore/natality_data_cleaned.RData"))