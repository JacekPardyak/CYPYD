README
================

## radomd

R wrapper for Python package `Pyadomd`
<https://github.com/S-C-O-U-T/Pyadomd>. An Rthonic on top of the
pythonic approach to query SSAS data models.

## Installation and set up

1.  Install `ADOMD`client library from
    <https://learn.microsoft.com/en-us/analysis-services/client-libraries?view=asallproducts-allversions>

2.  Install `Reticulate` R library

3.  Install `Pyadomd` Python library to be used by `Reticulate` in R.

4.  Install `radomd` R library:

``` r
devtools::install_github("JacekPardyak/radomd")
```

5.  Set up environmental variables:

``` r
Sys.setenv(adomd_path = "/Program Files/Microsoft.NET/ADOMD.NET/160",
           conn_str = "Data Source=localhost; Provider=MSOLAP; initial catalog=Analysis Services Tutorial")
```

## Query SSAS Tabular model with R

1.  You can use creator:

``` r
library(radomd)
Sys.setenv(adomd_path = "/Program Files/Microsoft.NET/ADOMD.NET/160",
           conn_str = "Data Source=localhost; Provider=MSOLAP; initial catalog=Analysis Services Tutorial")
Query() %>% cube("[Adventure Works]") %>%
  rows(c("[Product].[Product Line].[Product Line].MEMBERS")) %>% 
  columns(c("[Measures].[Internet Sales Count]", "[Measures].[Internet Sales-Sales Amount]")) %>%
  slicers(c("[Sales Territory].[Sales Territory Country].[Australia]")) %>% execute()
```

2.  Or you can use MDX to get the same result:

``` r
library(radomd)
Query() %>% mdx("SELECT {[Measures].[Internet Sales Count],
[Measures].[InternetSales-Sales Amount]} ON COLUMNS, 
{[Product].[Product Line].[Product Line].MEMBERS} ON ROWS
FROM [Analysis Services Tutorial] 
WHERE [Sales Territory].[Sales Territory Country].[Australia]") %>% execute()
```
