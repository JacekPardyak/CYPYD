#' Add slicers to the Query
#'
#' @param theObject A Query class.
#' @param string What to use as slicers.
#'
#' @return A Query.
#' @include query.R
#' @exportMethod slicers
#' @examples
#' library(magrittr)
#' Query() %>% slicers(c("[Sales Territory].[Sales Territory Country].[Australia]"))
#' @export
setGeneric(
  name = "slicers",
  def = function(theObject, string)
  {
    standardGeneric("slicers")
  }
)
#' @export
setMethod(
  f = "slicers",
  signature = "Query",
  definition = function(theObject, string)
  {
    theObject@slicers <- string
    validObject(theObject)
    return(theObject)
  }
)
