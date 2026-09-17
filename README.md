# spotmapr

**Interactive epidemiological spot maps for India — no GIS software, no shapefiles, no setup.**

[![R >= 4.1](https://img.shields.io/badge/R-%3E%3D%204.1.0-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/ADARV-Epi-hub/spotmapr/blob/main/LICENSE)
[![Install from GitHub](https://img.shields.io/badge/install-GitHub-black.svg)](#guide-for-developers)

`spotmapr` turns a spreadsheet of case/control coordinates into a polished, interactive
HTML map you can open in any browser or drop straight into a report. India's state and
district boundaries are built in — you don't download or configure anything. It is the R
companion to the Python package [`spotmap`](https://github.com/ADARV-Epi-hub/spotmap).

- 📍 **Spot pins** for individual cases and controls, in colours you choose
- 🔴 **Dot-density** clustering to spot hotspots at a glance
- 🗺️ Built-in **state & district boundaries** — nothing to download
- 🏷️ Toggle place-name labels, resize pins, and switch modes live
- 💾 Export the finished map to **PNG** or **PDF**
- 🤖 **Auto-detects** your latitude / longitude / outcome columns

---

## Which guide is for me?

| If this sounds like you… | Go to |
|---|---|
| 🙋 **"I just want a map — I don't write code."** | → [Guide for non-coders](#guide-for-non-coders) |
| 👩‍💻 **"I use R and want the function reference."** | → [Guide for developers](#guide-for-developers) |

---

## Guide for non-coders

The simplest way to run R without installing anything is **Posit Cloud** — free RStudio in
your web browser.

**Step 1** — Open **[posit.cloud](https://posit.cloud)**, sign up free, and click **New Project → New RStudio Project**.

**Step 2** — Paste these three lines into the Console and press Enter:
```r
install.packages("remotes")
remotes::install_github("ADARV-Epi-hub/spotmapr")
library(spotmapr); spotmap()
```
(The first install takes a couple of minutes — that's normal.)

**Step 3** — Follow the simple prompts:
1. Point it to **your data file** when asked.
2. Confirm the **latitude**, **longitude**, and **case/control** columns it detected.
3. Choose which value means a **"case"** (e.g. `case`, `positive`, `1`).

Your map is saved as an HTML file to download and share.

> 💡 Prefer your own computer? Install [R](https://cloud.r-project.org/) and
> [RStudio](https://posit.co/download/rstudio-desktop/) first, then run the same three lines.
> See [Preparing your data](#preparing-your-data) for how your file should look.

---

## Guide for developers

### Install
```r
# install.packages("remotes")
remotes::install_github("ADARV-Epi-hub/spotmapr")
```
R >= 4.1. On Linux, `sf` needs `libgdal-dev`, `libproj-dev`, and `libgeos-dev`
([sf guide](https://r-spatial.github.io/sf/#installing)); Windows and macOS install a binary.

### Usage
```r
library(spotmapr)

spotmap()                                        # interactive wizard
spot_map("my_cases.csv", output = "map.html")    # direct call, auto-detected columns
```

### Common arguments
| Argument | Description |
|---|---|
| `data` | Path to a CSV / Excel / TSV file, or a `data.frame` |
| `lat_col`, `lon_col`, `outcome_col` | Override column auto-detection |
| `case_value` | Value in `outcome_col` that means "case" |
| `all_cases` | `TRUE` treats every row as a case (no controls) |
| `state_shp`, `district_shp` | Use your own boundary shapefiles |
| `cluster_color`, `case_color`, `control_color` | Marker colours (hex) |
| `output` | Path to save the HTML (returns the widget if `NULL`) |

Run `?spot_map` for the full reference.

---

## Preparing your data

A CSV / Excel / TSV file (or a `data.frame`) with, at minimum, **location** and **outcome**:

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
anyone switch between **Dot Density** and **Spot Pins**, show **Cases Only** or
**Cases & Controls**, recolour markers, resize pins, toggle **place-name labels**, and
export to **PNG / PDF**.

---

## Team

spotmapr is developed by the **ADARV** team: **Muniraj Mallesan** (maintainer),
**Dr. Sharan Murali** (team lead), Manikandan K, Shanmuga Sundharam, Yogita Chaudhary,
Barath U, Balaji S, and Deepana R.

## License

MIT © ADARV
