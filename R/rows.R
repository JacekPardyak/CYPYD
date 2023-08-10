#' Add rows to the Query
#'
#' @param theObject A Query class.
#' @param string What to show in rows.
#'
#' @return A Query.
#' @include query.R
#' @export
#' @exportMethod rows
#' @docType methods
#' @rdname rows-methods
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
#' @rdname rows-methods
#' @aliases rows,character,ANY-method
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