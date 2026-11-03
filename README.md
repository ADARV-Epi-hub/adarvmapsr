# adarvmapsr

**Interactive epidemiological spot maps for India — no GIS software, no shapefiles, no setup.**

[![R >= 4.1](https://img.shields.io/badge/R-%3E%3D%204.1.0-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/ADARV-Epi-hub/adarvmapsr/blob/main/LICENSE)
[![Install from GitHub](https://img.shields.io/badge/install-GitHub-black.svg)](#guide-for-developers)

AdarvMaps turns a spreadsheet of latitude and longitude from the field into a polished,
interactive HTML map. You can open the map in any browser, personalise it, and download
it as a **PNG** image or a **PDF**. AdarvMaps already has India's state and district
boundaries built in, so you don't have to search for shapefiles. This is the R package;
there is a matching Python package, [`adarvmaps`](https://github.com/ADARV-Epi-hub/adarvmaps).

---

## Preparing your data

Please ensure each **row** in your spreadsheet is **one person or event**, and that each
row carries its **location** (latitude and longitude) in separate columns. You may also
include an extra column that splits the data into **case** and **control** (a *grouping
variable*), if you want to show both on the same map.

---

## What will AdarvMaps do?

AdarvMaps turns your spreadsheet into an interactive map. It automatically places every row
as a **dot** at its location, draws the correct **state and district boundaries** for you,
and colours the two groups differently. It then generates a single, self-contained **HTML**
file you can open in any browser to personalise your map, download as a PNG or PDF, or email
to a colleague. You can also aggregate the dots to switch from a spot map to a **dot-density**
map.

With AdarvMaps you can make:

- 📍 **Spot maps** — show the location of individual people or events
- 🔴 **Dot-density maps** — show the clustering of cases

---

## Which guide is for me?

| If this sounds like you… | Go to |
|---|---|
| 🙋 **"I just want a map — I don't write code."** | → [Guide for non-coders](#guide-for-non-coders) |
| 👩‍💻 **"I use R and want the function reference."** | → [Guide for developers](#guide-for-developers) |

---

## Guide for non-coders

This guide is for anyone who wants to create a map but has never written any R code. The
simplest way to run R without installing anything is **Posit Cloud** — free RStudio in your
web browser.

### Step 1 — Open a free RStudio in your browser
Go to **[posit.cloud](https://posit.cloud)**, sign up free, and click
**New Project → New RStudio Project**. The box where you type is called the *Console*.

### Step 2 — Start AdarvMaps
Paste these three lines into the Console and press **Enter**:
```r
install.packages("remotes")
remotes::install_github("ADARV-Epi-hub/adarvmapsr")
library(adarvmapsr); adarvmaps()
```
The first two lines install AdarvMaps (a couple of minutes the first time — that's normal);
the third line starts the guided wizard.

### Step 3 — Answer the questions
AdarvMaps asks **five** questions. For each one it shows its own best guess in **[brackets]** —
if the guess is right, just press **Enter** to accept it; otherwise, type the number of the
correct choice.

**1. Where is your data file?**
- In Posit Cloud, first upload your spreadsheet with the *Upload* button in the **Files**
  panel (bottom-right), then type its file name (CSV, Excel `.xlsx` / `.xls`, or TSV).
- AdarvMaps then prints a quick summary — how many rows and columns it found, each column name
  with an example value, and the first few rows — so you can confirm the file was read
  correctly.
- **Please note:** on **Posit Cloud**, your data is processed on Posit's servers. If you run
  R **on your own computer** (RStudio Desktop), the data stays on your system.

**2. Which column has the latitude?**
- Latitude is the north–south number (for example, `28.61` for Delhi).
- AdarvMaps pre-selects the column it thinks is the latitude. If the guess is correct, press
  Enter to accept; otherwise, check the summary above and type the number of the right column.

**3. Which column has the longitude?**
- Longitude is the east–west number (for example, `77.20` for Delhi).
- AdarvMaps pre-selects the column it thinks is the longitude. If the guess is correct, press
  Enter to accept; otherwise, check the summary above and type the number of the right column.
- **Remember:** if the points later look misplaced, the most common mistake is that latitude
  and longitude are swapped.

**4. Which column is your grouping variable?**
- If your spreadsheet has a variable that splits the data into *cases* and *controls*, or
  *affected* and *not affected*, choose it here — we call this the **grouping variable**.
- You can equally use this to show *males* and *females*, *dead* and *alive*, or *positive*
  and *negative* differently on the map.
- If you don't want any split, choose the first option: *My data is all cases (no control
  group)*.

**5. Which value is the main group?**
- AdarvMaps lists the values found in the grouping variable you chose in question 4.
- Tell it which value is the **main group** (the highlighted / clustered group). For example,
  if you coded `1 = Case, 0 = Control` or `Yes = Case, No = Control`, choose `1` or `Yes`.
- Every other value becomes the other group, shown with its own name from your data.

Once you've answered all five, AdarvMaps builds the map as an HTML file.

### Step 4 — Get your map
- AdarvMaps saves your map as a file (e.g. `adarvmaps_200926.html`) and tells you where it is.
- Download it and open it in any browser, or email it to a colleague — it's a single
  self-contained file (an internet connection is needed to load the background map tiles).
- Using the map's sidebar you can:
  - Switch between the **Spot Map** and the **Dot-Density Map**
  - Show one group or both
  - Change the colours of the dots and resize them
  - Turn place-name labels on or off
  - Save the map as a **PNG** image or **PDF**

---

## Guide for developers

### Step 1 — Install
```r
# install.packages("remotes")
remotes::install_github("ADARV-Epi-hub/adarvmapsr")
```
R >= 4.1. On Linux, `sf` needs `libgdal-dev`, `libproj-dev`, and `libgeos-dev`
([sf guide](https://r-spatial.github.io/sf/#installing)); Windows and macOS install a binary.

### Step 2 — Use it
```r
library(adarvmapsr)

adarvmaps()                                     # interactive wizard
spot_map("my_data.csv", output = "map.html")   # direct call, auto-detected columns
```

### R function reference
```r
spot_map(
  data,                      # required: a CSV / Excel / TSV path, or a data.frame
  state_shp = NULL,          # custom state boundary (shapefile / GeoPackage)
  district_shp = NULL,       # custom district boundary
  lat_col = NULL,            # override column auto-detection
  lon_col = NULL,
  outcome_col = NULL,        # the grouping column
  case_value = NULL,         # which value in outcome_col is the main group
  case_label = NULL,         # name for the main group (default: the data's own value)
  control_label = NULL,      # name for the other group (default: the data's own value)
  all_cases = FALSE,         # treat every row as a case (no second group)
  count_cutoff = 2,          # districts <= cutoff -> district-level zoom
  margin_deg = 1.0,          # boundary crop padding
  cluster_color = "#E85252", # dot-density bubble colour
  case_color = "#D55757",    # main-group pin colour
  control_color = "#7676E7", # other-group pin colour
  output = NULL              # path to save the HTML (returns the widget if NULL)
)
```
`adarvmaps()` is a friendly alias for `spot_map()`. Run `?spot_map` in R for the full help.

### Common arguments
| Argument | Description |
|---|---|
| `data` | Path to a CSV / Excel / TSV file, or a `data.frame` |
| `lat_col`, `lon_col`, `outcome_col` | Override column auto-detection |
| `case_value` | Value in `outcome_col` that is the main group |
| `case_label`, `control_label` | Names shown for the two groups (default: the data's values) |
| `all_cases` | `TRUE` treats every row as a case (no second group) |
| `state_shp`, `district_shp` | Use your own boundary shapefiles |
| `cluster_color`, `case_color`, `control_color` | Marker colours (hex) |
| `output` | Path to save the HTML (returns the widget if `NULL`) |

---

## Extra notes

### Preparing your data (details)
AdarvMaps **auto-detects** the columns — you don't have to rename anything. At a minimum it
needs **location**, and optionally a **grouping** column:

| What AdarvMaps needs | Possible column names | How to provide it |
|---|---|---|
| **Coordinates** | `lat`, `lon` (or `latitude`, `longitude`) | Separate `lat` / `lon` columns |
| **Grouping** (optional) | `outcome`, `status`, `case_control`, `case` | A column with two values, e.g. `case` / `control` |

**Example:**
```csv
latitude,longitude,outcome
28.6,77.2,case
19.0,72.8,control
13.0,80.2,case
```

### What you get
A single, self-contained HTML file you can open in any browser or share. Its sidebar lets
anyone switch between **Dot Density** and **Spot Pins**, show one group or both, recolour
and resize markers, toggle **place-name labels**, and export to **PNG / PDF**.

---

## ADARV Team

adarvmapsr is developed by the **ADARV** team:

1. **Muniraj Mallesan** (Maintainer)
2. **Dr. Sharan Murali** (Team Lead)
3. Manikandan K
4. Shanmuga Sundharam
5. Yogita Chaudhary
6. Barath U
7. Balaji S
8. Deepana R

## Data source

The bundled India state and district boundaries are from the **Survey of India**,
used under the **Government Open Data License – India
([GODL-India](https://data.gov.in/government-open-data-license-india))**, which
permits redistribution with attribution. The geometries are simplified for
visual mapping and are not intended for precise measurement or official boundary
determination.

## License

The `adarvmapsr` package code is released under the MIT License — © ADARV.
(The bundled boundary data is under GODL-India; see **Data source** above.)
