## Developer NOTE: consider switchng to arrow::S3FileSystem-based method.
## doesn't support sync out-of-box, but lighter dependency 
## since arrow is already in use.


#' Download GBIF data using aws.s3 sync
#'
#' Sync a local directory with selected release of the AWS copy of GBIF
#' @param version 'prefix' string (folder) from the 
#' https://registry.opendata.aws/gbif/ which should be synced. 
#' See available dates [here](https://gbif-open-data-eu-central-1.s3.eu-central-1.amazonaws.com/index.html#occurrence/).
#' @param dir path to local directory where parquet files should be stored
#' @param base_url S3 Bucket Base URL
#' @param prefix prefix to occurrence data
#' @param bucket S3 bucket name, must match desired region. 
#' @param region S3 data region, see https://github.com/gbif/occurrence/blob/master/aws-public-data.md for the available regions.
#' @details
#' Sync parquet files from GBIF public data catalogue,
#' <https://registry.opendata.aws/gbif/>
#'
#' Note that data can also be found on the Microsoft Cloud,
#' <https://planetarycomputer.microsoft.com/dataset/gbif>
#'
#' Also, some users may prefer to download this data using an alternative
#' interface or work on a cloud-host machine where data is already available.
#' @export
#'
#' @examplesIf interactive()
#' ## Choose closest AWS region (e.g. central Europe)
#' gbif_download(region = "eu-central-1", bucket = "gbif-open-data-eu-central-1")
#' 
#' ## Choose snapshot date
#' gbif_download(version = "2021-12-01")
#' 
#'
gbif_download <-
  function(version = "2021-11-01", 
           dir = gbif_dir(),
           base_url = "s3.amazonaws.com",
           bucket = "gbif-open-data-ap-southeast-2",
           prefix = paste0("occurrence/", version),
           region = "ap-southeast-2") {
  ## Fixme detect version, maybe w/o AWS dependency
  if (!requireNamespace("aws.s3", quietly = TRUE)) {
    stop("the aws.s3 package is required for automatic download", call. = FALSE)
  }
  ## Public access fails if user has a secret key configured
  unset_aws_env()
  aws.s3::s3sync(dir,
                 base_url = base_url,
                 bucket = bucket,
                 prefix = prefix,
                 region = region)
}
