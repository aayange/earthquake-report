# R/01-import.R — Download earthquake data from USGS
#
# Downloads the past 30 days of M4.5+ earthquakes worldwide.
# This is the only file that knows where the data comes from.

dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
dir.create("data/clean", recursive = TRUE, showWarnings = FALSE)

url <- paste0(
  "https://earthquake.usgs.gov/earthquakes/",
  "feed/v1.0/summary/4.5_month.csv"
)

download.file(url, "data/raw/earthquakes.csv")

cat("Downloaded data/raw/earthquakes.csv\n")
