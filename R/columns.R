#' Add columns to the Query
#' 
#' @param theObject A Query class.
#' @param string What to show in columns.
#'
#' @return A Query.
#' @include query.R
#' @export
#' @exportMethod columns
#' @docType methods
#' @rdname columns-methods
#' @examples
#' library(magrittr)
#' Query() %>% columns(c("[Measures].[Internet Sales Count]", 
#' "[Measures].[Internet Sales-Sales Amount]"))
#' @export
setGeneric(
  name = "columns",
  def = function(theObject, string)
  {
    standardGeneric("columns")
  }
)
#' @rdname columns-methods
#' @aliases columns,character,ANY-method
setMethod(
  f = "columns",
  signature = "Query",
  definition = function(theObject, string)
  {
    theObject@columns <- string
    validObject(theObject)
    return(theObject)
  }
)


