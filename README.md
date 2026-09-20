# adarvmapr

**Interactive epidemiological spot maps for India — no GIS software, no shapefiles, no setup.**

[![R >= 4.1](https://img.shields.io/badge/R-%3E%3D%204.1.0-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/ADARV-Epi-hub/adarvmapr/blob/main/LICENSE)
[![Install from GitHub](https://img.shields.io/badge/install-GitHub-black.svg)](#guide-for-developers)

`adarvmapr` turns a spreadsheet of latitude and longitude from the field into a polished,
interactive HTML map. You can open the map in any browser, make edits, and download it as a
**PNG** image or **PDF**. India's state and district boundaries are already built in, so you
don't have to search for shapefiles. It is the R companion to the Python package
[`adarvmap`](https://github.com/ADARV-Epi-hub/adarvmap).

- 📍 **Spot maps** — show the location of individual people or events
- 🔴 **Dot-density maps** — aggregate nearby points to show clustering of cases
- 🗺️ Built-in **state & district boundaries** — nothing to download
- 🎨 Recolour and resize markers, toggle place-name labels, export to PNG / PDF
- 🤖 **Auto-detects** your latitude / longitude / outcome columns

---

## What will adarvmapr do?

It turns your spreadsheet into an interactive map — placing every row as a **dot** at its
location, drawing the correct **state and district boundaries**, and colouring the groups
(e.g. cases and controls) differently. It produces a single, self-contained **HTML** file
you can open in any browser, fine-tune, download as a PNG or PDF, or share. You can also
aggregate the dots to switch from a spot map to a **dot-density** map.

---

## Which guide is for me?

| If this sounds like you… | Go to |
|---|---|
| 🙋 **"I just want a map — I don't write code."** | → [Guide for non-coders](#guide-for-non-coders) |
| 👩‍💻 **"I use R and want the function reference."** | → [Guide for developers](#guide-for-developers) |

Everyone should also read [Preparing your data](#preparing-your-data) first.

---

## Preparing your data

Each **row** in your spreadsheet should be **one person or event**, and each row should
carry its **location** (latitude and longitude) in separate columns. You may also include
an extra column that splits the data into groups (e.g. case / control) if you want to show
both on the same map.

---

## Guide for non-coders

This guide is for anyone who wants a map but has never written any R code. The simplest way
to run R without installing anything is **Posit Cloud** — free RStudio in your web browser.

### Step 1 — Open a free RStudio in your browser
Go to **[posit.cloud](https://posit.cloud)**, sign up free, and click
**New Project → New RStudio Project**. The box where you type is called the *Console*.

### Step 2 — Start adarvmapr
Paste these three lines into the Console and press **Enter**:
```r
install.packages("remotes")
remotes::install_github("ADARV-Epi-hub/adarvmapr")
library(adarvmapr); adarvmap()
```
The first two lines install the package (a couple of minutes the first time — that's
normal); the third starts the guided wizard.

### Step 3 — Answer the questions
adarvmapr asks **five** questions. Each shows its own best guess in **[brackets]** — press
**Enter** to accept it, or type the number of the correct choice.

1. **Where is your data file?** In Posit Cloud, first upload your spreadsheet with the
   *Upload* button in the Files panel (bottom-right), then type its name (CSV, Excel
   `.xlsx` / `.xls`, or TSV). adarvmapr prints a quick summary so you can confirm it loaded.
2. **Which column has the latitude?** The north–south number (e.g. `28.61` for Delhi).
3. **Which column has the longitude?** The east–west number (e.g. `77.20` for Delhi). If the
   points later look misplaced, latitude and longitude may be swapped.
4. **Which column is your grouping variable?** The column that splits the data into two
   groups — case / control, male / female, dead / alive, positive / negative. The map uses
   the **actual values from your data** as the group names automatically. Choose *No
   grouping — show all rows the same* if there's no split.
5. **Which value is the main group?** Tell it which value is the main (highlighted) group;
   everything else becomes the other group, shown with its own name.

### Step 4 — Get your map
adarvmapr saves your map as an HTML file and tells you where it is. Open it in any browser
— it's a single self-contained file (an internet connection is needed to load the
background map tiles). The sidebar lets you switch between **Spot Map** and **Dot Density**,
show one group or both, change colours and pin sizes, toggle place-name labels, and export
to **PNG** or **PDF**.

---

## Guide for developers

### Install
```r
# install.packages("remotes")
remotes::install_github("ADARV-Epi-hub/adarvmapr")
```
R >= 4.1. On Linux, `sf` needs `libgdal-dev`, `libproj-dev`, and `libgeos-dev`
([sf guide](https://r-spatial.github.io/sf/#installing)); Windows and macOS install a binary.

### Usage
```r
library(adarvmapr)

adarvmap()                                      # interactive wizard
spot_map("my_cases.csv", output = "map.html")    # direct call, auto-detected columns
```

### Common arguments
| Argument | Description |
|---|---|
| `data` | Path to a CSV / Excel / TSV file, or a `data.frame` |
| `lat_col`, `lon_col`, `outcome_col` | Override column auto-detection |
| `case_value` | Value in `outcome_col` that means "case" |
| `case_label`, `control_label` | Names for the two groups, e.g. "Male" / "Female" |
| `all_cases` | `TRUE` treats every row as a case (no controls) |
| `state_shp`, `district_shp` | Use your own boundary shapefiles |
| `cluster_color`, `case_color`, `control_color` | Marker colours (hex) |
| `output` | Path to save the HTML (returns the widget if `NULL`) |

Run `?spot_map` for the full reference.

---

## Preparing your data (details)

A CSV / Excel / TSV file (or a `data.frame`) with, at minimum, **location** and (optionally)
an **outcome**:

| Column | Example values |
|---|---|
| latitude | `11.01`, `28.61` |
| longitude | `76.96`, `77.21` |
| outcome | `case`, `control` |

Column names are **auto-detected** from common variants — `lat`, `latitude`, `y`; `lon`,
`long`, `longitude`, `x`; `outcome`, `status`, `case_control`, `class`.

---

## What you get

A single, self-contained HTML file you can open in any browser or share. Its sidebar lets
anyone switch between **Dot Density** and **Spot Pins**, show one group or both, recolour
and resize markers, toggle **place-name labels**, and export to **PNG / PDF**.

---

## ADARV Team

adarvmapr is developed by the **ADARV** team: **Muniraj Mallesan** (maintainer),
**Dr. Sharan Murali** (team lead), Manikandan K, Shanmuga Sundharam, Yogita Chaudhary,
Barath U, Balaji S, and Deepana R.

## License

MIT © ADARV
