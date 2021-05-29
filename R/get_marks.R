##' Get the list marks from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve all of the marks currently in the Great
##' Lakes Fish Stocking database (www.fsis.glfc.org). The get_marks()
##' function takes an optional filter list which can be used to return
##' marks of a particular type (chemical, physical, thermal, dye,
##' uknown)
##'
##' See http://fsis.glfc.com/api/public_urls/#v1-common-marks-list for the full list of
##' available filter keys (query parameters)
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_marks()
##' get_marks(list(mark_type="chemical"))

get_marks <- function(filter_list = list()) {
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/common/mark/%s",
    get_root_url(),
    query_string
  )
  return(api_to_dataframe(my_url))
}
