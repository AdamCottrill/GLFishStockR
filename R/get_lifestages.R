##' Get the Life Stages from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve all of the life stages currently in the
##' Great Lakes Fish Stocking database (www.fsis.glfc.org).  The
##' returned dataframe contains the abbreviation used for the
##' lifestage and a simple description.
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_lifestages()
##'
get_lifestages <- function() {
  #
  my_url <- sprintf(
    "%s/stocking/lifestage/",
    get_root_url()
  )
  return(api_to_dataframe(my_url))
}
