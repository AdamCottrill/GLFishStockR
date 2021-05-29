##' Get the Stocking Methods from the Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve all of the stocking methods currently in
##' the Great Lakes Fish Stocking database (www.fsis.glfc.org).  The
##' returned dataframe contains the abbreviation used for the stocking
##' method (stk_meth) and the a longer description.
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_stocking_methods()
##'
get_stocking_methods <- function() {
  my_url <- sprintf(
    "%s/stocking/stocking_method/",
    get_root_url()
  )
  return(api_to_dataframe(my_url))
}
