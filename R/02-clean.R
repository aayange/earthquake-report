library(tidyverse)
library(lubridate)

raw <- read_csv("data/raw/earthquakes-raw.csv", show_col_types = FALSE)

clean <- raw |>
  filter(type == "earthquake") |>
  mutate(
    date   = as.Date(time),
    region = str_extract(place, "[^,]+$") |> str_trim()
  ) |>
  select(date, latitude, longitude, depth, mag, place, region) |>
  filter(!is.na(mag), !is.na(date))

dir.create("data/clean", recursive = TRUE, showWarnings = FALSE)
write_csv(clean, "data/clean/earthquakes-clean.csv")
