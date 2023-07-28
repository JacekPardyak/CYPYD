#' Add rows to the Query
#'
#' @param theObject A Query class.
#' @param string What to show in rows.
#'
#' @return A Query.
#' @include query.R
#' @export
#' @exportMethod rows
#' @examples
#' library(magrittr)
#' Query() %>% rows(c("[Product].[Product Line].[Product Line].MEMBERS"))
#' @export
setGeneric(
  name = "rows",
  def = function(theObject, string)
  {
    standardGeneric("rows")
  }
)
#' @export
setMethod(
  f = "rows",
  signature = "Query",
  definition = function(theObject, string)
  {
    theObject@rows <- string
    validObject(theObject)
    return(theObject)
  }
)