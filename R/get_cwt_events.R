##' Get CWT stocking events from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve Coded Wire Tag (cwt) stocking events
##' the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  This function takes an
##' optional filter list which can be used to return stocking event
##' based on several attributes of either the cwt or the associated
##' stocking event.
##'
##' See http://fsis.glfc.com/api/docs/#v1-common--list
##' for the full list of available filter keys (query parameters)
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_cwt_events(list(cwt_number=c(431655,431656,431657)))
##' get_cwt_events(list(cwt_number_like="4316""))
##' get_cwt_events(list(lake="ON"))
##'
get_cwt_events <- function(filter_list = list()) {
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/stocking/get_cwt_events/%s",
    get_root_url(),
    query_string
  )
  return(api_to_dataframe(my_url))
}
