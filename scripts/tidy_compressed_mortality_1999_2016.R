# Describing cause of death data from CDC Wonder
# René Dario Herrera 
# University of Arizona Cancer Center COE 
# renedherrera at email dot arizona dot edu 
# data source: Compressed Mortality File is produced by the National Center for Health Statistics (NCHS), at the Centers for Disease Control and Prevention (CDC). 
# citation: Centers for Disease Control and Prevention, National Center for Health Statistics. Compressed Mortality File 1999-2016 on CDC WONDER Online Database, released June 2017. Data are from the Compressed Mortality File 1999-2016 Series 20 No. 2U, 2016, as compiled from data provided by the 57 vital statistics jurisdictions through the Vital Statistics Cooperative Program. Accessed at http://wonder.cdc.gov/cmf-icd10.html on Aug 10, 2021 12:16:21 PM

# set up ####

# packages and libraries 
library(here)
library(janitor)
library(tidyverse)

# read data 
mort_df <- read_tsv("data/raw/Compressed Mortality, 1999-2016.txt") %>%
  clean_names()

# inspect 
glimpse(mort_df)

# cause of death 
mort_df %>%
  distinct(cause_of_death)

# find heart disease
mort_df %>%
  filter(str_detect(cause_of_death, "heart")) %>%
  arrange(desc(deaths))

# find cancer 
mort_df %>%
  filter(year == 2016) %>%
  arrange(desc(deaths))
