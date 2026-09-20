# Null-coalesce operator (not exported)
`%||%` <- function(a, b) if (is.null(a)) b else a

# Friendly welcome shown when the package is attached, to help first-time
# (non-coder) users know how to launch the tool.
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Interactive AdarvMap for India - created by ADARV\n",
    "\n",
    "No code required! To build your map, just run:\n",
    "\n",
    "adarvmap()\n",
    "\n",
    "You'll be asked to choose your data file, then your map appears."
  )
}
