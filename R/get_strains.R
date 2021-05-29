##' Get the list strains from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve all of the strains currently in the Great
##' Lakes Fish Stocking database (www.fsis.glfc.org).  Strains is the
##' high level group used to aggregrate detail strain information
##' provided by the stocking agecies (see get_raw_strain() to access
##' those values).  The get_strain() function takes an optional filter
##' list which can be used to return strains associated with a
##' particular species
##'
##' See http://fsis.glfc.com/api/docs/#v1-common-strains-list for the full list of
##' available filter keys (query parameters)
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_strains()
##' get_strains(list(species="LAT"))

get_strains <- function(filter_list = list()) {
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/common/strain/%s",
    get_root_url(),
    query_string
  )

  return(api_to_dataframe(my_url))
}
