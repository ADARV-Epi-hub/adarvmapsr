# Null-coalesce operator (not exported)
`%||%` <- function(a, b) if (is.null(a)) b else a

# Friendly welcome shown when the package is attached, to help first-time
# (non-coder) users know how to launch the tool.
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "SpotMap by ADARV  -  turn your case data into an interactive map of India (no coding needed).\n",
    "\n",
    "  Get started - just run:\n",
    "\n",
    "      spotmap()\n",
    "\n",
    "  You'll be asked to choose your data file, then your map is built for you.\n",
    "  (Advanced: spotmap(\"data.csv\", output = \"map.html\") builds it directly.)"
  )
}
