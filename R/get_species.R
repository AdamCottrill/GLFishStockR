##' Get the list species from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe
##' and calls the api endpoint to retrieve all of the species
##' currently in the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  The returned dataframe contains the
##' abbreviation, common_name, scientific_name, amd species_code fo
##' each species.
##'
##' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
##' @return dataframe
##' @export
##' @examples
##'
##' get_species()
##'

get_species <- function() {
  my_url <- sprintf(
    "%s/common/species/",
    get_root_url()
  )
  return(api_to_dataframe(my_url))
}
