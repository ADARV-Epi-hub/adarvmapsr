# adarvmapsr 0.1.20

## New features
- Any binary **grouping variable**: the grouping column can now split the data
  by sex, vital status, test result, etc. — not just case/control. The map's
  legend, pop-ups, and category menu automatically use the **actual values from
  your data** (e.g. "Dead" / "Alive") as the group names, so the wizard no
  longer asks you to name the groups. `spot_map()` still accepts optional
  `case_label` / `control_label` to override the names.
- The interactive wizard now calls this the "grouping variable" (not
  "outcome"), and Step 5 asks which value is the **main group**.


# adarvmapsr 0.1.19

## Changes
- Returned to the CARTO Positron basemap (sharper look, native to zoom 20),
  now with an API key so CARTO no longer watermarks the tiles. The key is set
  once via the `carto_key` value in `spot_map()`; it is embedded in every
  generated map, so treat it as public. (0.1.18 had temporarily switched to
  Esri's key-free but softer World Light Gray Canvas.)


# adarvmapsr 0.1.18

## Fixes
- Switched the basemap from CARTO (Positron) to Esri's "World Light Gray
  Canvas". CARTO now requires an API key for its basemap tiles and stamps a
  repeating "API KEY REQUIRED" watermark on keyless requests; the Esri tiles
  are served without a key, so maps render cleanly again. The no-labels base
  plus toggleable place-name labels behave exactly as before. Esri tiles are
  native to zoom 16 and upscaled beyond that, so there are no blank tiles.


# adarvmapsr 0.1.17

## Improvements
- Simplified the `library(adarvmapsr)` startup message to match the Python
  package: flush-left, no indentation, and clearer wording
  ("Interactive AdarvMaps for India - created by ADARV ... just run
  `adarvmaps()`").


# adarvmapsr 0.1.16

## Improvements
- Reworded the interactive wizard's step questions in plain language
  (latitude/longitude, case vs control, and which value marks a case).


# adarvmapsr 0.1.15

## Improvements
- Friendlier, plainer wording throughout: the `library(adarvmapsr)` welcome
  message, the interactive wizard intro and finish message, and hover
  tooltips on every toolbar control (Pin Size, Category, Map Type,
  Labels, Recenter, Download).


# adarvmapsr 0.1.14

## Bug fixes
- Moved the map legend to the bottom-left so it no longer covers the
  zoom (+/-) buttons.


# adarvmapsr 0.1.13

## New features
- `adarvmaps()` is now available as an alias for `spot_map()`, so both
  spellings work.
- A friendly startup message is shown when the package is attached
  (`library(adarvmapsr)`), pointing new users to `adarvmaps()`.


# adarvmapsr 0.1.12

## New features
- **OpenStreetMap place-name labels** can now be toggled on/off from the
  sidebar. The base map switched to the no-labels CARTO variant so labels
  (state / district / city / town, rendered by CARTO from OpenStreetMap)
  can be shown or hidden with a sliding switch (off by default).

## UI
- **New top toolbar** in the ADARV navy/blue theme replaces the floating
  side panel: pill controls for Category (case/control filter + colours),
  Map Type (dot density / spot pins), a Labels on/off switch, Recenter,
  and a Download menu (PNG / Print-PDF).
- A credit caption ("Interactive spot maps for India - created by ADARV")
  appears at the bottom of the map (included in PNG/PDF exports).

## Credits
- Added the full ADARV team to the package authors (`DESCRIPTION`), the
  README, and a new `AUTHORS.md`; copyright holder updated to ADARV.


# adarvmapsr 0.1.11

## New features
- **Cases-only mode** for datasets without a case/control variable
  (e.g. outbreak surveillance, where every row is a case). Pass
  `all_cases = TRUE` to `spot_map()` to skip outcome detection and
  treat every row as a case. The interactive wizard now offers
  "(No outcome column - treat all rows as cases)" as the first
  option in Step 4.

## Robustness fixes (pre-CRAN edge-case audit)
- Rows with missing or out-of-range latitude / longitude no longer
  crash the build; they are dropped with a one-line warning telling the
  user how many rows were skipped.
- Empty input data frames now produce a clear "Input data is empty"
  error instead of a confusing "could not auto-detect lat/lon" message.
- A warning is emitted when most points fall outside India's bounding
  box (lat 6-38, lon 67-98), which usually means the lat / lon columns
  were swapped.
- Scientific-notation coordinates (e.g. `1.1e1`) are now recognised by
  the column-type detector.
- Internal helper columns renamed from leading-underscore names
  (`_outcome_norm`, `_auto_lat`, `_auto_lon`) to namespaced
  `.adarvmapsr_*` names, so users who happen to have a column literally
  called `_outcome_norm` no longer have their data silently overwritten.

## New features
- Interactive wizard (`run_interactive()` and `spot_map()` with no args)
  now prompts for the output HTML path (Step 6), matching the Python
  version's behaviour.
- Live cluster colour picker actually recolors clusters via
  `refreshClusters()` — the icon function now reads
  `window.clusterBaseColor` dynamically.
- Pin colour & pin size sliders now work because pins are rendered as
  `L.Marker` with DivIcons that JS can mutate via `setIcon()`.
- "Download PNG" button is wired up via
  `leaflet-simple-map-screenshoter` (CDN).
- A red error banner now surfaces sidebar JS failures instead of
  swallowing them in the browser console.

## Bug fixes
- `detect_lat_lon()` no longer secretly mutates the caller's data frame
  via `parent.frame()`; it returns the (possibly augmented) data frame
  in the result list under `$df`.
- `detect_outcome()` now errors loudly with the list of available values
  when a user-supplied `case_value` isn't present in the column.
- Dropped a redundant `setView()` call that was immediately overridden
  by `fitBounds()`.
- Removed unused internal `sf_to_geojson()`.

## Internal
- Replaced brittle `eachLayer` + `instanceof` JS layer lookup with R
  leaflet's own `layerManager.getLayerGroup()` — the same mechanism
  `hideGroup`/`showGroup` use.
- Added README.md and NEWS.md.
- Added regression tests for `detect_outcome` validation and
  `detect_lat_lon`'s new return shape.

# adarvmapsr 0.1.10

- Initial release.
