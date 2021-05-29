##' Get the list raw strains from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve all of the raw (detailed) strains
##' currently in the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  Raw Stains are detailed values submitted by
##' contributing agencies. The get_raw_strain() function takes an
##' optional filter list which can be used to return raw strains
##' associated with a particular species or strain.
##'
##' See http://fsis.glfc.com/api/docs/#v1-common-raw-strainraw-list for
##' the full list of available filter keys (query parameters)
##'
##' @param filter_list list
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @seealso get_strains
##' @examples
##'
##' get_raw_strains()
##' get_raw_strains(list(species="LAT"))
##' get_raw_strains(list(strain="SEN"))
get_raw_strains <- function(filter_list = list()) {
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/common/strainraw/%s",
    get_root_url(),
    query_string
  )
  return(api_to_dataframe(my_url))
}
