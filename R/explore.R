#' Explore query
#'
#' @param theObject Query.
#'
#' @return A string.
#' @include query.R
#' @export
#' @exportMethod explore
#' @docType methods
#' @rdname explore-methods
#' @examples
#' library(magrittr)
#' Query() %>% explore()
#' @export
setGeneric(
  name = "explore",
  def = function(theObject)
  {
    standardGeneric("explore")
  }
)
#' @rdname explore-methods
#' @aliases explore,character,ANY-method
setMethod(
  f = "explore",
  signature = "Query",
  definition = function(theObject)
  {
    if (nchar(theObject@mdx) == 0) {
      fmt <- "SELECT {%s} ON COLUMNS, {%s} ON ROWS FROM %s WHERE %s"
      mdx <-
        sprintf(
          fmt,
          paste(theObject@columns, collapse = ", "),
          paste(theObject@rows, collapse = ", "),
          theObject@cube,
          paste(theObject@slicers, collapse = ", ")
        )
    }
    else {
      mdx = theObject@mdx
    }
    return(mdx)
  }
)
