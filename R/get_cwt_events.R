##' Get CWT stocking events from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve Coded Wire Tag (cwt) stocking events the
##' Great Lakes Fish Stocking database (www.fsis.glfc.org).  This
##' function takes an optional filter list which can be used to return
##' stocking event based on several attributes of either the cwt or
##' the associated stocking event. If no filter list is provided, only
##' the first page of results are fetched from the api (and a warning
##' is issued)
##'
##' See http://fsis.glfc.org/api/public_urls/#stocking-get_cwt_events-list
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
##' get_cwt_events(list(cwt_number_like="4316"))
##' get_cwt_events(list(lake="ON"))
##'
get_cwt_events <- function(filter_list = list()) {
  if (length(filter_list) == 0 || "page" %in% names(filter_list)) {
    if (!("page" %in% names(filter_list))) {
      filter_list <- list(page = 1)
      warning(paste0(
        "No filters provided. Only the first page of results will be fetched.\n",
        "Provide a list of filter values to select specific records."
      ))
    }
    recursive <- FALSE
  } else {
    recursive <- TRUE
  }
  check_filters("get_cwt_events", filter_list)
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/stocking/get_cwt_events/%s",
    get_root_url(),
    query_string
  )

  return(api_to_dataframe(my_url, recursive = recursive))
}
