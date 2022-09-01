#' Show filters available on the provided api endpoint
#'
#' Many of the  GLFSD API endpoints have a number of
#' available filters that allows the response to be taylored to your
#' particular needs.  This function takes and api endpoint name and
#' prints out all of the available filters.  If 'filter_like' is
#' provided, only those filters that contain the provided string are
#' printed.  If no endpoint name is provided, a list of available
#' endpoints will be displayed.
#'
#' See http://fsis.glfc.org/api/public_urls/ for more information on the
#' available filter keys (query parameters) for each endpoint
#'
#' @param endpoint - the name of the api endpoint. If no name is
#' provided, a list of available endpoints will be displayed.
#' @param filter_like - a partial string to match filter against
#'
#' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
#' @return NULL
#' @export
#' @examples
#' show_filters()
#' show_filters("strain")
#' show_filters("events", filter_like = "clip")
#'
show_filters <- function(endpoint="", filter_like = "") {

  if (!exists("api_filters")) get_api_filters()

  if(endpoint==""){
    msg <-
      "An endpoint name needs to be provided. Currently avaliable endpoint names are:\n"
    cat(msg)
    print(names(api_filters))
  } else {
    endpoint <- tolower(endpoint)
    filters <- api_filters[[endpoint]]
    if (is.null(filters)) {
      filters <- refresh_filters(endpoint)
    }
    if (!filter_like == "") {
      print(subset(filters, grepl(filter_like, filters$name)))
    } else {
      print(filters)
    }
  }
}
