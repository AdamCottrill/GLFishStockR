#' Check the filters against api filters
#'
#' This function is used within data fetching functions to verify that
#' the list of provided filters are known to exist.  If a filter
#' cannot be found, a warning is printed out the screen. If the global
#' api filter object does exist, it is populated before proceeding.
#'
#' @param endpoint - the name of the api endpoint
#' @param filters - vector of filter names that are to be applied to the
#'   endpoint.
#'
#' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
#' @return list
#' @export
#' @examples
#' check_filters("stocking_events", list("year"=2012, "species"="LAT"))
#' check_filters("stocking_events", list("year"=2012, "species"="LAT", 'col'="red"))
#' check_filters("foo", list("year"=2012, "species"="LAT"))
check_filters <- function(endpoint, filters) {
  if (!exists("api_filters")) get_api_filters()

  endpoint <- tolower(endpoint)

  known_filters <- api_filters[[endpoint]]
  if (is.null(known_filters)) {
    known_filters <- refresh_filters(endpoint)
  }

  diff <- setdiff(names(filters), known_filters$name)
  if (length(diff)) {
    tmp <- paste(diff, collapse = "\n + ")
    msg <- "Unknown filters provided. These will be ignored:\n + %s"
    msg <- sprintf(msg, tmp)
    warning(msg)
  }
}
