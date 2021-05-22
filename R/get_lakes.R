##' Get lakes data from Great Lakes Fish Stocking API
##'
##' This function is  a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve all of the lakes currently
##' in the Great Lakes Fish Stocking database (www.fsis.glfc.org)
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##' lakes <- get_lakes()
get_lakes <- function(){
  my_url <- sprintf("%s/common/lake/",
    get_root_url())
  return(api_to_dataframe(my_url))
}
