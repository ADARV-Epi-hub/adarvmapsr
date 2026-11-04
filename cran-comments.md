# adarvmapsr 0.1.20 — initial CRAN submission

## R CMD check results

* `R CMD check --as-cran` ran with **0 errors, 0 warnings, 0 notes** on:
  * Local: R 4.6.2, Windows 11 (x86_64)
* The package bundles simplified India boundary geometries (~2.8 MB, see below)
  so that maps work with no external downloads; the total stays well under the
  5 MB limit. If any check platform reports an "installed size is large" NOTE,
  this bundled data is the reason.

## Cross-platform checks

* Win-builder (R-devel): **0 errors, 0 warnings, 1 NOTE** — the standard
  "checking CRAN incoming feasibility" note; see "Notes raised by the checks"
  below. (R Under development, 2026-11-03 r90835 ucrt.)
* Win-builder (R-release), mac-builder: run before submission.

## Notes raised by the checks

The single NOTE comes from "checking CRAN incoming feasibility" and has three
parts, all expected or benign:

* **New submission.** This is the first release of the package to CRAN.
* **Possibly misspelled words in DESCRIPTION: GODL.** "GODL" is an acronym for
  the *Government Open Data License – India*, the licence under which the
  bundled boundary data is distributed. It is spelled correctly (also added to
  `inst/WORDLIST`).
* **Possibly invalid URL <https://data.gov.in/government-open-data-license-india>.**
  This is the official, canonical page for the GODL-India licence. The check
  reported a connection timeout because the data.gov.in server was temporarily
  unreachable from the check machine; the URL is correct and resolves normally
  in a browser.

## Reverse dependencies

This is a new submission; there are no reverse dependencies.

## Examples, tests and network use

* The examples that build a map are wrapped in `\dontrun{}` because they
  require an input data file from the user.
* Unit tests cover the column-detection and value-validation helpers; they do
  **not** access the network.
* The generated interactive map fetches basemap *tiles* from a tile server
  only when the resulting HTML is opened in a browser by the end user — this
  happens outside R and is not exercised by `R CMD check`.

## Bundled data files and their licence

`inst/extdata/state_boundary_lite.fgb` and
`inst/extdata/district_boundary_lite.fgb` are simplified administrative
boundary geometries for India. They contain only polygon geometry plus the
state and district name attributes, and are stored in compressed FlatGeobuf
format to keep the package small.

These boundaries are sourced from the **Survey of India** and are made
available under the **Government Open Data License – India (GODL-India)**,
which permits redistribution and adaptation provided the source is
acknowledged. The required attribution ("Source: Survey of India, under
GODL-India") is given in the package README, in the DESCRIPTION, and in the
bundled-data documentation (`inst/extdata/DATA_SOURCE.md`). No other party's
data is included.

## Maintainer

Muniraj Mallesan <adarv@nieicmr.org.in>
