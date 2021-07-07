##' Get 10-Minute Grids data from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve all of the 10-minute grids
##' currently in the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  This function takes an
##' optional filter list which can be used to return 10-minute grids
##' associated with a particular lake, jurisdiction, or management unit.
##'
##' See http://fsis.glfc.com/api/public_urls/#v1-common-grid10-list
##' for the full list of available filter keys (query parameters)
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
get_grid10s <- function(filter_list = list()) {
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/common/grid10/%s",
    get_root_url(),
    query_string
  )
  return(api_to_dataframe(my_url))
}
