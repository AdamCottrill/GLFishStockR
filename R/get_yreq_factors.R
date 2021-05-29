##' Get Yearling Equivalent Factors from Great Lakes Fish Stocking API
##'
##' This function is a wrapper around api_to_dataframe and calls the
##' api endpoint to retrieve all of the yearling equivalent factors
##' currently in the Great Lakes Fish Stocking database
##' (www.fsis.glfc.org).  Yearling equivalent factors are used to
##' adjust the number of fish stocked based on species and lifestage
##' to account for younger life stages that are often stocked in high
##' numbers but also suffer higher mortiality.  The yearling
##' equivalent factor is intented to standardize the number of fished
##' stocked to the yearling lifestage. The
##' get_yreq_factor() function takes an optional filter list which can be
##' used to return factors for a particular species or life stages.
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
##' get_yreq_factors()
##' get_yreq_factors(list(species="WAE"))
##' get_yreq_factors(list(species=c("BNT", "RBT")))
##' get_yreq_factors(list(lifestage="fry"))
##' get_yreq_factors(list(lifestage=c("fry", "ff")))

get_yreq_factors <- function(filter_list = list()) {
  query_string <- build_query_string(filter_list)
  my_url <- sprintf(
    "%s/stocking/yearling_equivalent/%s",
    get_root_url(),
    query_string
  )
  return(api_to_dataframe(my_url))
}
