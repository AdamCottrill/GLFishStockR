##' Get jurisdiction data from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve all of the jurisdictions
##' currently in the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  Jurisdiction is defined as the waters of a
##' lake within the bounds of a province or state.
##' "The Michigan waters of Lake Huron".  This function takes an
##' optional filter list which can be used to return jurisdictions
##' associated with a particular lake or state/province.
##'
##' See http://fsis.glfc.com/api/docs/#v1-common-jurisdiction-list for
##' the full list of available filter keys (query parameters)
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_jurisdictions()
##' get_jurisdictions(list(lake="HU"))
##' get_jurisdictions(list(stateprov="MI"))
##'
get_jurisdictions <- function(filter_list = list()) {
  #
  query_string <- build_query_string(filter_list)

  my_url <- sprintf(
    "%s/common/jurisdiction/%s",
    get_root_url(),
    query_string
  )

  return(api_to_dataframe(my_url))
}
