% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gbif_remote.R
\name{gbif_remote}
\alias{gbif_remote}
\title{gbif remote}
\usage{
gbif_remote(
  version = "2021-11-01",
  bucket = "gbif-open-data-af-south-1",
  to_duckdb = FALSE,
  ...
)
}
\arguments{
\item{version}{GBIF snapshot date}

\item{bucket}{GBIF bucket name (including region)}

\item{to_duckdb}{Return a remote duckdb connection or arrow connection?
Note that leaving as FALSE may be faster but is limited to the dplyr-style
operations supported by \link{arrow} alone.}

\item{...}{additional parameters passed to the s3_bucket() (e.g. for remote
access to independently hosted buckets)}
}
\description{
Connect to GBIF remote directly. Can be much faster than downloading
for one-off use or when using the package from a server in the same region
as the data.
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
\dontshow{\}) # examplesIf}
}
