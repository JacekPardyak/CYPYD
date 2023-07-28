library(devtools)
usethis::use_package("methods")
usethis::use_package("reticulate")
usethis::use_package("magrittr")

load_all()
check()
use_mit_license()

document()
install()

library(radomd)
library(magrittr)
Query() %>% execute()
Query() %>% cube("[Adventure Works]") %>% 
  columns(c("[Measures].[Internet Sales Count]", "[Measures].[Internet Sales-Sales Amount]"))

