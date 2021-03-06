% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parsers.R
\name{parse_isotopes}
\alias{parse_isotopes}
\title{Parse isotopes data spreadsheet}
\usage{
parse_isotopes(filename, dbh, worms_cache_directory = NULL,
  verbosity = 1, refresh_worms_cache = FALSE)
}
\arguments{
\item{filename}{string: path to Excel file}

\item{dbh}{optional: database handle}

\item{worms_cache_directory}{string: path to cache directory for taxonomic data}

\item{verbosity}{numeric: 0 = silent, > 0 = give progress messages}

\item{refresh_worms_cache}{logical: if \code{TRUE}, refresh the taxonomic cache}
}
\value{
A list object with the parsed data
}
\description{
Parse isotopes data spreadsheet
}
\examples{
\dontrun{
  ## use the example file bundled with the package
  filename <- system.file("extdata/example_isotope_data.xls",
                          package = "dietdataentry")
  x <- parse_isotopes(filename)

  ## same, but using a local cache for the taxon lookups, which will be faster
  x <- parse_isotopes(filename, worms_cache_directory = "~/.Rcache")
}

}
