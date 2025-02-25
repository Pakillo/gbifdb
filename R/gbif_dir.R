
#' Default storage location
#'
#' Default location can be set with the env var GBIF_HOME,
#' otherwise will use the default provided by [tools::R_user_dir()]
#'
#' @export
#' @examples 
#' gbif_dir()
gbif_dir <- function(){
  Sys.getenv("GBIF_HOME",
             tools::R_user_dir("gbif"))

}
