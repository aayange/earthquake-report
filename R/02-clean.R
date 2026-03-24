# R/02-clean.R — Clean and transform the raw earthquake data
#
# Reads from data/raw/, writes to data/clean/.
# Does not know or care how the raw data got there.

library(readr)
library(dplyr)
library(stringr)
library(lubridate)

raw <- read_csv("data/raw/earthquakes.csv", show_col_types = FALSE)

clean <- raw |>
  select(time, latitude, longitude, depth, mag, place) |>
  mutate(
    datetime = ymd_hms(time),
    date = as_date(datetime),
    region = str_trim(str_extract(place, "[^,]+$"))
  ) |>
  select(datetime, date, latitude, longitude, depth, mag, place, region) |>
  arrange(desc(datetime))

write_csv(clean, "data/clean/earthquakes-clean.csv")

cat("Wrote data/clean/earthquakes-clean.csv:",
    nrow(clean), "earthquakes\n")
