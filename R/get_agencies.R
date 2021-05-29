##' Get agencies data from Great Lakes Fish Stocking API
##'
##' This function is a essentially a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve all of the agencies currently
##' in the Great Lakes Fish Stocking database (www.fsis.glfc.org).
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##' get_agencies()

get_agencies <- function() {
  my_url <- sprintf(
    "%s/common/agency/",
    get_root_url()
  )
  return(api_to_dataframe(my_url))
}
