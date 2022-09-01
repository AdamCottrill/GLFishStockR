#' Create global list of available API filters
#'
#' This function connects to the openapi/swagger endpoint provided by
#' http://fsis.glfc.org/  api and fetches all of the available
#' filters for each endpoint.  The filters are available in a global
#' list 'api_filters' which subsequently used by other functions -
#' check_filters, show_filters.  Generally, this function is not
#' intended to be called directly by the user.
#'
#'
#' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
#' @return list
get_api_filters <- function() {

  root_url <- get_root_url()
  swagger_url <- sprintf("%s/swagger.json", root_url)

  response <- tryCatch(httr::GET(swagger_url),
    error = function(err) {
      print("unable to fetch filters from the server. Are you connected to the internet?")
    }
  )

  json <- httr::content(response, "text", encoding = "UTF-8")

  payload <- tryCatch(
    jsonlite::fromJSON(json, flatten = TRUE),
    error = function(err) {
      print("unable able to parse the json response from:")
      print(swagger_url)
      return(list(paths = list()))
    }
  )

  api_filters <- list()
  for (name in names(payload$paths)) {
    endpoint <- gsub("/", "", name)
    endpoint <- gsub("^(common|stocking)", "", endpoint)
    if (endpoint=='events') endpoint <- "stocking_events"
    parameters <- payload$paths[[name]]$get$parameters
    if (length(parameters) & !grepl("\\{", endpoint)) {
      values <- subset(parameters, select = c("name", "description"))
      # api_filters <- c(api_filters, parse(endpoint) = values)
      api_filters[[endpoint]] <- values
    }
  }
  assign("api_filters", api_filters, envir = .GlobalEnv)
}
