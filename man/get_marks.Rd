% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_marks.R
\name{get_marks}
\alias{get_marks}
\title{Get the list marks from Great Lakes Fish Stocking API}
\usage{
get_marks(filter_list = list())
}
\arguments{
\item{filter_list}{list}
}
\value{
dataframe
}
\description{
This function is a wrapper around api_to_dataframe and calls the
api endpoint to retrieve all of the marks currently in the Great
Lakes Fish Stocking database (www.fsis.glfc.org). The get_marks()
function takes an optional filter list which can be used to return
marks of a particular type (chemical, physical, thermal, dye,
unknown)
}
\details{
See http://fsis.glfc.org/api/public_urls/#v1-common-marks-list for the full list of
available filter keys (query parameters)
}
\examples{

get_marks()
get_marks(list(mark_type="chemical"))
}
\author{
Adam Cottrill \email{adam.cottrill@ontario.ca}
}
