##' Get state/province data from Great Lakes Fish Stocking API
##'
##' This function is a essentially a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve all of the state_provinces
##' currently in the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  This function takes an
##' option filter list which can be used to return state_provinces
##' associated with a particular country.
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_state_provinces()
##' get_state_provinces(list(country="CA"))
##'
get_state_provinces <- function(filter_list = list()) {
  check_filters("state_province", filter_list)
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/common/state_province/%s",
    get_root_url(),
    query_string
  )
  return(api_to_dataframe(my_url))
}
