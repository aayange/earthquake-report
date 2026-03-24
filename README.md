# Earthquake Report

A Quarto website that downloads the latest global earthquake data from USGS and generates a summary report. Rebuilds weekly via GitHub Actions.

## Data Source

[USGS Earthquake Hazards Program](https://earthquake.usgs.gov) — all M4.5+ earthquakes worldwide from the past 30 days. The feed updates every five minutes.

URL: `https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_month.csv`

## How to Run

### Requirements

- R (>= 4.1)
- Quarto (bundled with RStudio, or install from [quarto.org](https://quarto.org))
- R packages: `tidyverse`, `lubridate`, `knitr`

### Install packages

```r
install.packages(c("tidyverse", "lubridate", "knitr"))
```

### Run the full pipeline

```bash
Rscript run-all.R
```

This downloads fresh data, cleans it, and renders the website to `_site/`.

## What It Produces

A static website in `_site/` with:

- A summary of recent earthquake activity
- A table of the 10 strongest earthquakes
- A daily count chart
- A magnitude distribution histogram
- A world map of earthquake locations
- A table of the most active regions

## Project Structure

```
earthquake-report/
├── _quarto.yml              # Website configuration
├── index.qmd                # Homepage
├── report.qmd               # Analysis report
├── R/
│   ├── 01-import.R          # Download raw data from USGS
│   └── 02-clean.R           # Clean and transform
├── data/
│   ├── raw/                 # Downloaded CSV (gitignored)
│   └── clean/               # Processed CSV (gitignored)
├── run-all.R                # Controller script
├── README.md                # This file
├── .gitignore
└── .github/workflows/
    └── update-report.yml    # Weekly rebuild via GitHub Actions
```

