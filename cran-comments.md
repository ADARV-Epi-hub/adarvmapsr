# adarvmapsr 0.1.20 — initial CRAN submission

## R CMD check results

* `R CMD check --as-cran` ran with **0 errors, 0 warnings** on:
  * Local: R 4.x, Windows 11 (x86_64)
* One NOTE is expected: "installed size is large" — the package bundles
  simplified India boundary geometries (~2.8 MB, see below) so that maps work
  with no external downloads. The total package stays under the 5 MB limit.

## Cross-platform checks

* Win-builder (R-devel, R-release): pending — running before submission
* R-hub (Linux, Windows, macOS): pending — running before submission
* mac-builder: pending — running before submission

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
