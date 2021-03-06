% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tax-worrms.R
\name{search_worms}
\alias{search_worms}
\title{Search for valid names}
\usage{
search_worms(scientific = NULL, common = NULL, ids = NULL,
  force = FALSE, follow_valid = TRUE, like = FALSE,
  try_fuzzy = FALSE, cache_directory, acceptable_status = c("accepted",
  "nomen dubium", "temporary name"), follow = c("unaccepted",
  "alternate representation"), filter = NULL, ...)
}
\arguments{
\item{scientific}{string: scientific name. This may also include special filters like \code{"Ctenophora@phylum:Ctenophora"} or \code{"Lumbricidae@marine_only:FALSE"}, see examples below}

\item{common}{string: common name}

\item{ids}{numeric or string: AphiaID to match on}

\item{force}{logical: if \code{TRUE}, force a cache refresh}

\item{follow_valid}{logical: if \code{TRUE} follow an invalid name to its valid name}

\item{like}{logical: if \code{TRUE}, add a percent sign after the name (SQL LIKE function)}

\item{try_fuzzy}{logical: if \code{TRUE}, try fuzzy matching on the query if an exact match fails to find a valid record}

\item{cache_directory}{string: path to a cache directory}

\item{acceptable_status}{character: vector of status values that we consider to be acceptable}

\item{follow}{character: vector of status values that we will follow through to try and find a valid name}

\item{filter}{list: for internal use}

\item{...}{: additional parameters passed to \code{link[worrms]{wm_records_name}}}
}
\value{
A data.frame (tibble) as returned by \code{\link[worrms]{wm_records_name}}
}
\description{
This function is a wrapper around \code{\link[worrms]{wm_records_name}} and related functions, that does its best to find a single valid match for our query.
}
\examples{
\dontrun{
  search_worms("Pachyptila turtur")

  search_worms(common = "Antarctic silverfish")

  ## valid name is Aequiyoldia eightsii
  search_worms("Yoldia eightsii")

  ## if we really wanted the unaccepted name record, we could do
  search_worms("Yoldia eightsii", acceptable_status = "unaccepted")
  ## or
  search_worms("Yoldia eightsii@status:unaccepted")
  ## but that's not really the point of the search_worms function, which is
  intended to resolve names to their valid versions
  ## if we wanted to see all possible matches for a name, use
  ## worms_records("Yoldia eightsii")

  ## typo
  search_worms("Vibllia stebbingi")

  ## typo with fuzzy matching
  search_worms("Vibllia stebbingi", try_fuzzy = TRUE)

  ## the actual name
  search_worms("Vibilia stebbingi")

  ## nomen dubium example
  search_worms("Teuthida")

  ## multiple exact matches
  search_worms("Ctenophora")
  ## we can restrict this search, e.g.
  ## search for Ctenophora that has phylum name Ctenophora
  search_worms("Ctenophora@phylum:Ctenophora")

  ## earthworms, these don't appear by default because they are not a marine taxon
  search_worms("Lumbricidae")
  ## allow non-marine taxa
  search_worms("Lumbricidae@marine_only:FALSE")
}
}
