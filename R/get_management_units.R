##' Get Management Units from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve all of the management units
##' currently in the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  This function takes an
##' optional filter list which can be used to return management units
##' associated with a particular lake, state/province, juristiction, or management
##' unit type (currently 'stat_dist' or 'qma').
##'
##' See http://fsis.glfc.com/api/docs/#v1-common-management_unit-list
##' for the full list of
##' available filter keys (query parameters)
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_grid10s()
##' get_grid10s(list(lake="ON"))
##' get_grid10s(list(mu_type="stat_dist"))
##'
get_management_units <- function(filter_list = list()) {
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/common/management_unit/%s",
    get_root_url(),
    query_string
  )
  return(api_to_dataframe(my_url))
}
