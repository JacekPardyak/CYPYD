#' Add cube to the Query
#'
#' @param theObject A Query class.
#' @param string A name of the cube.
#'
#' @return A Query.
#' @include query.R
#' @export
#' @exportMethod cube
#' @docType methods
#' @rdname cube-methods
#' @examples
#' library(magrittr)
#' Query() %>% cube("[Adventure Works]")
setGeneric(name="cube",
           def=function(theObject,string)
           {
             standardGeneric("cube")
           }
)
#' @rdname cube-methods
#' @aliases cube,character,ANY-method
setMethod(f="cube",
          signature="Query",
          definition=function(theObject,string)
          {
            theObject@cube <- string
            validObject(theObject)
            return(theObject)
          }
)