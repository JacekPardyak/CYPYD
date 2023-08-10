#' Optionally add mdx to the Query
#'
#' @param theObject A Query class.
#' @param string What to use as mdx.
#'
#' @return A Query.
#' @include query.R
#' @exportMethod mdx
#' @docType methods
#' @rdname mdx-methods
#' @examples
#' library(magrittr)
#' Query() %>% mdx("SELECT {[Measures].[Internet Sales Count], 
#' [Measures].[InternetSales-Sales Amount]} ON COLUMNS, 
#' {[Product].[Product Line].[Product Line].MEMBERS} ON ROWS 
#' FROM [Analysis Services Tutorial] 
#' WHERE [Sales Territory].[Sales Territory Country].[Australia]")
#' @export
setGeneric(
  name = "mdx",
  def = function(theObject, string)
  {
    standardGeneric("mdx")
  }
)
#' @rdname mdx-methods
#' @aliases mdx,character,ANY-method
setMethod(
  f = "mdx",
  signature = "Query",
  definition = function(theObject, string)
  {
    theObject@mdx <- string
    validObject(theObject)
    return(theObject)
  }
)