#import necessary packages
library(tidyverse)
library(ggplot2)
library(here)
library(readr)

##Read data
#read csv data into variable, from years 2006 - 2021
natality_csv_2021 <- read_csv(here('dataset-ignore/data-ignore', 'nat2021us.csv'), n_max = 100000, show_col_types = FALSE)
natality_csv_2020 <- read_csv(here('dataset-ignore/data-ignore', 'nat2020us.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2019 <- read_csv(here('dataset-ignore/data-ignore', 'nat2019us.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2018 <- read_csv(here('dataset-ignore/data-ignore', 'nat2018us.csv'), n_max = 100000, show_col_types = FALSE)
natality_csv_2017 <- read_csv(here('dataset-ignore/data-ignore', 'natl2017.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2016 <- read_csv(here('dataset-ignore/data-ignore', 'natl2016.csv'), n_max = 100000, show_col_types = FALSE)
natality_csv_2015 <- read_csv(here('dataset-ignore/data-ignore', 'natl2015.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2014 <- read_csv(here('dataset-ignore/data-ignore', 'natl2014.csv'), n_max = 100000, show_col_types = FALSE)
natality_csv_2013 <- read_csv(here('dataset-ignore/data-ignore', 'natl2013.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2012 <- read_csv(here('dataset-ignore/data-ignore', 'natl2012.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2011 <- read_csv(here('dataset-ignore/data-ignore', 'natl2011.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2010 <- read_csv(here('dataset-ignore/data-ignore', 'natl2010.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2009 <- read_csv(here('dataset-ignore/data-ignore', 'natl2009.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2008 <- read_csv(here('dataset-ignore/data-ignore', 'natl2008.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2007 <- read_csv(here('dataset-ignore/data-ignore', 'natl2007.csv'), n_max = 1000, show_col_types = FALSE)
natality_csv_2006 <- read_csv(here('dataset-ignore/data-ignore', 'natl2006.csv'), n_max = 1000, show_col_types = FALSE)

#combines data together (uses 2021 columns, removes incompatible columns, fills unknown values from 2021 columns with NA)
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

#create historical natality data
natality_csv_historical <- combine_data(data, natality_csv_2021)

# code to load rds file
# natality_rds_2021 = readRDS(here::here('dataset-ignore','natality_rds_2021.rds'))
# natality_rds_historical = readRDS(here::here('dataset-ignore','natality_rds_historical.rds'))

#create cleaned csv with values
write_csv(natality_csv_2021, file = here::here("dataset-ignore", "natality_csv_2021.csv"))
write_csv(natality_csv_historical, file = here::here("dataset-ignore", "natality_data_historical.csv"))

#create separate csvs for any year for analysis
write_csv(natality_csv_2014, file = here::here("dataset-ignore", "natality_csv_2014.csv"))
write_csv(natality_csv_2016, file = here::here("dataset-ignore", "natality_csv_2016.csv"))
write_csv(natality_csv_2018, file = here::here("dataset-ignore", "natality_csv_2018.csv"))

#save data as R file
save(natality_csv_2021, file = here::here("dataset-ignore/natality_csv_2021.RData"))
save(natality_csv_historical, file = here::here("dataset-ignore/natality_data_cleaned_2016.RData"))

#save it as an rds file
saveRDS(natality_csv_2021, here::here('dataset-ignore', 'natality_data_cleaned_2021.rds'))
saveRDS(natality_csv_historical, here::here('dataset-ignore', 'natality_data_cleaned_2021.rds'))
