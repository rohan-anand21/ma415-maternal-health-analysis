library(tidyverse)
library(ggplot2)
library(here)
library(readr)

##Read data
#read csv data into variable, from years 2006 - 2021
natality_csv_2021 <- read_csv(here('dataset-ignore/data-ignore', 'nat2021us.csv'), n_max = 500000, show_col_types = FALSE)
natality_csv_2020 <- read_csv(here('dataset-ignore/data-ignore', 'nat2020us.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2019 <- read_csv(here('dataset-ignore/data-ignore', 'nat2019us.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2018 <- read_csv(here('dataset-ignore/data-ignore', 'nat2018us.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2017 <- read_csv(here('dataset-ignore/data-ignore', 'natl2017.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2016 <- read_csv(here('dataset-ignore/data-ignore', 'natl2016.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2015 <- read_csv(here('dataset-ignore/data-ignore', 'natl2015.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2014 <- read_csv(here('dataset-ignore/data-ignore', 'natl2014.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2013 <- read_csv(here('dataset-ignore/data-ignore', 'natl2013.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2012 <- read_csv(here('dataset-ignore/data-ignore', 'natl2012.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2011 <- read_csv(here('dataset-ignore/data-ignore', 'natl2011.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2010 <- read_csv(here('dataset-ignore/data-ignore', 'natl2010.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2009 <- read_csv(here('dataset-ignore/data-ignore', 'natl2009.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2008 <- read_csv(here('dataset-ignore/data-ignore', 'natl2008.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2007 <- read_csv(here('dataset-ignore/data-ignore', 'natl2007.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2006 <- read_csv(here('dataset-ignore/data-ignore', 'natl2006.csv'), n_max = 1000, show_col_types = FALSE)

#combines data together (uses 2021 columns, removes incompatible, fills unknown with NA)
combine_data <- function(data, reference) {
  tibbles <- lapply(data, function(tibble) {
    tibble <- tibble[, names(tibble) %in% names(reference), drop = FALSE]
    missing_cols <- setdiff(names(reference), names(tibble))
    for (col in missing_cols) {
      tibble[[col]] <- NA
    }
    tibble <- tibble[, names(reference), drop = FALSE]
    return(tibble)
  })
  combined <- bind_rows(tibbles)
  return(combined)
}

data <- list(natality_csv_2020, natality_csv_2019, natality_csv_2018, natality_csv_2017, natality_csv_2016, 
             natality_csv_2015, natality_csv_2014, natality_csv_2013, natality_csv_2012, natality_csv_2011,
             natality_csv_2010, natality_csv_2009, natality_csv_2008, natality_csv_2007, natality_csv_2006)

natality_csv_historical <- combine_data(data, natality_csv_2021)

#removes unnecessary columns
clean_data <- function(data, columns_to_remove) {
  data |>
    select(-all_of(columns_to_remove)) |>
    filter(dob_tt != 9999) |>
    filter(!bfacil %in% c(7, 9)) |>
    filter(mbstate_rec != 3) |>
    filter(!mhispx %in% c(6, 9)) |>
    filter(mar_p != 'U') |>
    filter(dmar != 9) |>
    filter(meduc != 9) |>
    filter(fagerec11 != 11) |>
    filter(!fhispx %in% c(6, 9)) |>
    filter(feduc != 9) |>
    filter(priorlive != 99) |>
    filter(priordead != 9) |>
    filter(priorterm != 9) |>
    filter(lbo_rec != 9) |>
    filter(tbo_rec != 9) |>
    filter(illb_r != 999) |>
    filter(precare != 99) |>
    filter(previs != 99) |>
    filter(wic != 'U') |>
    filter(cig_0 != 99) |>
    filter(cig_1 != 99) |>
    filter(cig_2 != 99) |>
    filter(cig_3 != 99) |>
    filter(m_ht_in != 99) |>
    filter(bmi != 99.9) |>
    filter(pwgt_r != 999) |>
    filter(dwgt_r != 999) |>
    filter(wtgain != 99) |>
    filter(rf_pdiab != 'U') |>
    filter(rf_gdiab != 'U') |>
    filter(rf_phype != 'U') |>
    filter(rf_ghype != 'U') |>
    filter(rf_ehype != 'U') |>
    filter(rf_ppterm != 'U') |>
    filter(rf_inftr != 'U') |>
    filter(rf_fedrg != 'U') |>
    filter(rf_artec != 'U') |>
    filter(rf_cesar != 'U') |>
    filter(rf_cesarn != 99) |>
    filter(no_risks != 9) |>
    filter(ip_gon != 'U') |>
    filter(ip_syph != 'U') |>
    filter(ip_chlam != 'U')
} #26

# Define the columns to remove 
columns_to_remove <- c('f_rf_ncesar', 'f_rf_cesar', 'f_rf_inf_art', 'f_rf_inf_drg', 'f_rf_ppb', 'f_rf_eclamp', 'f_rf_ghyper', 'f_rf_phyper', 'f_rf_gdiab', 'f_rf_pdiab', 'f_wtgain', 'wtgain_rec', 'f_dwgt', 'f_pwgt', 'f_m_ht', 'f_tobaco', 'cig_rec', 'f_cigs_3', 'f_cigs_2', 'f_cigs_1', 'f_cigs_0', 'f_wic', 'f_tpcv', 'previs_rec', 'precare5', 'f_mpcb', 'ilp_r11', 'ilp_r', 'ilop_r11', 'ilop_r', 'illb_r11', 'fracehisp', 'f_fhisp', 'fhisp_r', 'frace15', 'frace6', 'fagecomb', 'fagerpt_flg', 'f_meduc', 'f_mar_p', 'mar_imp', 'f_facility', 'bfacil3', 'mage_impflg', 'mage_repflg', 'mager14', 'mager9', 'mrace6', 'mrace15', 'mraceimp', 'f_mhisp')

natality_data_cleaned_2021 <- clean_data(natality_csv_historical, columns_to_remove)
natality_data_cleaned_historical <- clean_data(natality_csv_2021, columns_to_remove)

# #load rds file
# natality_rds_2021 = readRDS(here::here('dataset-ignore','natality_rds_2021.rds'))
# natality_rds_historical = readRDS(here::here('dataset-ignore','natality_rds_historical.rds'))

#create cleaned csv with values
write_csv(natality_data_cleaned_2021, file = here::here("dataset-ignore", "natality_data_cleaned_2021.csv"))
write_csv(natality_data_cleaned_historical, file = here::here("dataset-ignore", "natality_data_cleaned_historical.csv"))

#save data as R file
save(natality_data_cleaned_2021, file = here::here("dataset-ignore/natality_data_cleaned_2021.RData"))
save(natality_data_cleaned_historical, file = here::here("dataset-ignore/natality_data_cleaned_2016.RData"))

#save it as an rds file
saveRDS(natality_data_cleaned_2021, here::here('dataset-ignore', 'natality_data_cleaned_2021.rds'))
saveRDS(natality_data_cleaned_2021, here::here('dataset-ignore', 'natality_data_cleaned_2021.rds'))

