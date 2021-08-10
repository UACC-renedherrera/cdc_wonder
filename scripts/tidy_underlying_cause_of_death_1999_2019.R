# Describing cause of death data from CDC Wonder
# René Dario Herrera 
# University of Arizona Cancer Center COE 
# renedherrera at email dot arizona dot edu 
# data source: 
# citation: Centers for Disease Control and Prevention, National Center for Health Statistics. Underlying Cause of Death 1999-2019 on CDC WONDER Online Database, released in 2020. Data are from the Multiple Cause of Death Files, 1999-2019, as compiled from data provided by the 57 vital statistics jurisdictions through the Vital Statistics Cooperative Program. Accessed at http://wonder.cdc.gov/ucd-icd10.html on Aug 10, 2021 1:28:18 PM

# set up ####

# packages and libraries 
library(here)
library(janitor)
library(tidyverse)

# read data 
mort_df <- read_tsv("data/raw/Underlying Cause of Death, 1999-2019.txt",
                    na = c("", "NA", "Unreliable"),
                    col_types = c("cccccccnnnn")) %>%
  clean_names()

# inspect 
glimpse(mort_df)

# cause of death 
mort_df %>%
  distinct(cause_of_death)

# find heart disease
mort_df %>%
  filter(str_detect(cause_of_death, "heart")) %>%
  distinct(cause_of_death) %>%
  select(cause_of_death, deaths)

# find cancer 
mort_df %>%
  filter(year == 2016) %>%
  arrange(desc(deaths))
