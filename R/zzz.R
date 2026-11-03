# Null-coalesce operator (not exported)
`%||%` <- function(a, b) if (is.null(a)) b else a

# Friendly welcome shown when the package is attached, to help first-time
# (non-coder) users know how to launch the tool.
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Interactive AdarvMaps for India - created by ADARV\n",
    "\n",
    "ADARV is jointly funded by the Indian Council of Medical Research [ICMR] ",
    "through the Pradhan Mantri Ayushman Bharat Health Infrastructure Mission ",
    "[PM-ABHIM] and the Isaac Centre for Public Health [ICPH] through the Ajit ",
    "Isaac Foundation [AIF].\n",
    "\n",
    "No code required! To build your map, just run:\n",
    "\n",
    "adarvmapsr()\n",
    "\n",
    "You'll be asked to choose your data file, then your map appears."
  )
}
