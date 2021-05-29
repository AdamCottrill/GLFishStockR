##' Given a url submit the request and return the results as a
##' dataframe.
##'
##' Given a url submit the request and return the results as a
##' dataframe. If the response is paginated, the functions is called
##' recursively until all of the pages have been loaded ($next is
##' null) (this should have a limit on it some day.)
##'
##' @param url string
##' @param data dataframe
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe

api_to_dataframe <- function(url, data = NULL) {
  response <- httr::GET(url)
  json <- httr::content(response, "text", encoding = "UTF-8")
  payload <- jsonlite::fromJSON(json, flatten = TRUE)

  if (!is.null(payload[["results"]])) {
    if (is.null(data)) {
      data <- payload$results
    } else {
      data <- rbind(data, payload$results)
    }

    next_url <- payload$`next`
    if (!is.null(next_url)) {
      data <- api_to_dataframe(next_url, data)
    }
    return(data)
  } else {
    data <- payload
  }


  return(data)
}
