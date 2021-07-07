##' Get stocking events from Great Lakes Fish Stocking API
##'
##' This is one of the main functions in the GLFishStockR package.  It
##' calls the api endpoint to retrieve stocking events
##' the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  This function takes an
##' optional filter list which can be used to return stocking event
##' based on several attributes of the
##' stocking event such as species, lake, agency, first year, as last year.
##'
##' See http://fsis.glfc.com/api/public_urls/#v1-stocking-event-list
##' for the full list of available filter keys (query parameters)
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_cwt_events(list(lake="ON", species=c('BNT', 'RBT')))
##'
get_stocking_events <- function(filter_list = list()) {
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

  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/stocking/events/%s",
    get_root_url(),
    query_string
  )
  cat(my_url)
  return(api_to_dataframe(my_url, recursive = recursive))
}
