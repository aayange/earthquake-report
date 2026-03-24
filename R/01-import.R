library(tidyverse)

url <- "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_month.csv"
dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
download.file(url, "data/raw/earthquakes-raw.csv")
