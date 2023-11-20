#import libraries
library(tidyverse)

##Read data
#read csv data into variable
natality_csv_2021 <- read_csv(here::here('dataset-ignore','nat2021us.csv'), n_max = 100000, show_col_types = FALSE)
natality_csv_2016 <- read_csv(here::here('dataset-ignore','natl2016.csv'), n_max = 100000, show_col_types = FALSE)

#save it as an rds file
saveRDS(natality_csv_2021, here::here('dataset-ignore', 'natality_rds_2021.rds'))
saveRDS(natality_csv_2016, here::here('dataset-ignore', 'natality_rds_2016.rds'))

#load rds file
natality_rds_2021 = readRDS(here::here('dataset-ignore','natality_rds_2021.rds'))
natality_rds_2016 = readRDS(here::here('dataset-ignore','natality_rds_2016.rds'))


## CLEAN the data
#remove unnecessary columns
columns_to_remove <- c("mage_impflg", 'lmpused', 'obgest_flg', 'compgst_imp', 'imp_sex', 'fagerpt_flg', 'imp_plur', "mar_p", "fhisp_r", "mage_repflg", "mager14", "mager9", "f_mar_p", "mraceimp",   "f_meduc", "fagecomb", "frace6", "fhisp_r", "mhisp_r", "mracehisp", "f_fhisp",   "mar_imp", "f_meduc", "f_mpcb", "f_tpcv", "f_cigs_0", "f_cigs_1", "f_cigs_2",   "f_cigs_3", "f_tobaco", "f_m_ht", "f_rf_gdiab", "f_rf_phyper", "f_rf_ghyper",   "f_rf_eclamp", "f_rf_ppb", "cig_0", "cig_1", "cig_2", "cig_3", "f_apgar5", "f_ab_vent", "f_ab_vent6",   "f_ab_surfac", "f_ab_antibio", "f_ab_seiz", "f_ca_anen", "f_ca_menin",   "f_ca_heart", "f_ca_hernia", "f_ca_ompha", "f_ca_gastro", "f_ca_limb", "f_ca_cleftlp",   "f_ca_cleft", "f_ca_downs", "f_ca_chrom")
natality_data_cleaned_2021 <- natality_rds_2021 |>
  select(-all_of(columns_to_remove))

natality_data_cleaned_2016 <- natality_rds_2016 |>
  select(-all_of(columns_to_remove))


#create cleaned csv with values
write_csv(natality_data_cleaned_2021, file = here::here("dataset-ignore", "natality_data_cleaned_2021.csv"))
write_csv(natality_data_cleaned_2016, file = here::here("dataset-ignore", "natality_data_cleaned_2016.csv"))

#save data as R file
save(natality_data_cleaned_2021, file = here::here("dataset-ignore/natality_data_cleaned_2021.RData"))
save(natality_data_cleaned_2016, file = here::here("dataset-ignore/natality_data_cleaned_2016.RData"))

