#' Execute query
#'
#' @param theObject Query.
#'
#' @return A tibble.
#' @include query.R
#' @export
#' @exportMethod execute
#' @docType methods
#' @rdname execute-methods
#' @examples
#' \dontrun{
#' Sys.setenv(adomd_path = "/Program Files/Microsoft.NET/ADOMD.NET/160", 
#' conn_str = "Data Source=localhost; Provider=MSOLAP; 
#' initial catalog=Analysis Services Tutorial")
#' Query() %>% execute()
#' }
setGeneric(
  name = "execute",
  def = function(theObject)
  {
    standardGeneric("execute")
  }
)
#' @rdname execute-methods
#' @aliases execute,character,ANY-method
setMethod(
  f = "execute",
  signature = "Query",
  definition = function(theObject)
  {
    'from sys import path
path.append("%s")
from pyadomd import Pyadomd
conn_str = "%s"
def get_state():
  with Pyadomd(conn_str) as conn:
    df = print(conn.state)
    return df' %>%
      sprintf(Sys.getenv("adomd_path"), Sys.getenv("conn_str")) %>%
      writeLines('state.py')
    
    'from sys import path
path.append("%s")
from pyadomd import Pyadomd
from pandas import DataFrame
conn_str = "%s"
def get_data(x):
  with Pyadomd(conn_str) as conn:
    with conn.cursor().execute(x) as cur:
      df = DataFrame(cur.fetchone(), columns=[i.name for i in cur.description])
      tmp = df.select_dtypes(include="object")
      tmp.fillna("NULL", inplace = True)
      df = tmp.join(df.select_dtypes(exclude="object"))
  return df' %>% sprintf(Sys.getenv("adomd_path"), Sys.getenv("conn_str")) %>% writeLines('lib.py')
    
    if ( nchar(theObject@mdx) == 0 & nchar(theObject@cube) == 0) {
      reticulate::source_python('state.py')
      return(get_state())
    }
    else if (nchar(theObject@mdx) == 0) {
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
    reticulate::source_python('lib.py')
    df <- get_data(mdx)
    #unlink('lib.py')
    return(df)
  }
)
