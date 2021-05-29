##' Get the Fish Condition from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve condition codes and their associated
##' descriptions from the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  The returned dataframe contains the code and
##' a short description for each one,
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_conditions()
##'
get_conditions <- function() {
  my_url <- sprintf(
    "%s/stocking/condition/",
    get_root_url()
  )
  return(api_to_dataframe(my_url))
}
