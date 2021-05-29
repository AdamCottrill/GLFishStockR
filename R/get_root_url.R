##' Internal function to return the root url for our api.
##'
##' This funciton gis intended to be used by all of the functions that
##' call an api endpoint.  If the api enpoint changes in the future,
##' (ie - the domain name changes or the version changes) we just need
##' to update this value.  Note that the url string does *NOT* include
##' a trailing slash.
##'
##' To use a local version of fsdviz api during developement, set the
##' local environment variable to True:
##'
##'     >  Sys.setenv(FSDVIZ_DEV=TRUE)
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return string
##'
get_root_url <- function() {
  if (Sys.getenv("FSDVIZ_DEV") == "") {
    # production
    API_ROOT_URL <- "http://fsis.glfc.org/api/v1"
  } else {
    # local development
    API_ROOT_URL <- "http://127.0.0.1:8000/api/v1"
  }
  return(API_ROOT_URL)
}
