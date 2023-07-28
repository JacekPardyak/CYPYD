#' Query Class
#'
#' Provides convenient & easy access to Ocean Networks Canada's data.
#' For detailed information and usage examples, visit our
#' \href{https://wiki.oceannetworks.ca/display/O2A/R+Client+Library}{official Documentation}.
#'
#' @slot cube character. User token
#' @slot columns logical. Print verbose debug comments
#' @slot rows numeric. Number of seconds before a request to the API is canceled
#' @slot slicers character. Base URL for API requests
#' @slot mdx character. Output path for downloaded files
#' @export
#' @exportClass Query
#' @import methods
Query <- setClass(
  # Set the name for the class
  "Query",
  
  # Define the slots
  slots = c(
    cube = "character",
    columns  = "character",
    rows = "character",
    slicers   = "character",
    mdx   = "character"
  ),
  
  # Set the default values for the slots. (optional)
  prototype=list(
    cube = "",
    columns   = "",
    rows = "",
    slicers = "",
    mdx = ""
  ),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity=function(object)
  {
    if(length(object@rows)>100.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  },
)
