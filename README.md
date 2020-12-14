
<!-- README.md is generated from README.Rmd. Please edit that file -->

# goodreadr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/goodreadr)](https://CRAN.R-project.org/package=goodreadr)
<!-- badges: end -->

The goal of goodreadr is to scrape data from goodreads.

## Installation

You can install the released version of goodreadr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("goodreadr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(goodreadr)
## basic example code
```

Get quotes from a book:

``` r
quotes_dat <- gr_quotes("https://www.goodreads.com/work/quotes/85056676-covid-19-the-great-reset") 

quotes_dat
#> # A tibble: 7 x 10
#>   author author_url book_title book_url text  likes hyperlink ratings avg_rating
#>   <chr>  <chr>      <chr>      <chr>    <chr> <dbl> <chr>       <dbl>      <dbl>
#> 1 Klaus~ https://w~ COVID-19:~ https:/~ “His~     0 https://~     188       3.11
#> 2 Klaus~ https://w~ COVID-19:~ https:/~ “How~     0 https://~     188       3.11
#> 3 Klaus~ https://w~ COVID-19:~ https:/~ “The~     0 https://~     188       3.11
#> 4 Klaus~ https://w~ COVID-19:~ https:/~ “Out~     0 https://~     188       3.11
#> 5 Klaus~ https://w~ COVID-19:~ https:/~ “The~     0 https://~     188       3.11
#> 6 Klaus~ https://w~ COVID-19:~ https:/~ “How~     0 https://~     188       3.11
#> 7 Klaus~ https://w~ COVID-19:~ https:/~ “As ~     0 https://~     188       3.11
#> # ... with 1 more variable: reviews <dbl>
```

``` r
quotes_dat$text
#> [1] "“History shows that epidemics have been the great resetter of countries’ economy and social fabric. Why should it be different with COVID-19?”"                                                                                                                                                                                                                                                                         
#> [2] "“How can the US administration, for example, accept that 97% of antibiotics supplied in the country come from China?”"                                                                                                                                                                                                                                                                                                  
#> [3] "“They will also agree with Winston Churchill, who once observed that the US has an innate capability to learn from its mistakes when he remarked that the US always did the right thing when all the alternatives have been exhausted.”"                                                                                                                                                                                
#> [4] "“Outright collapse is not an outlandish scenario for petrostates like Ecuador or Venezuela, where the virus could overwhelm the countries’ few functioning hospitals very quickly.”"                                                                                                                                                                                                                                    
#> [5] "“The sobering truth is that the heroes of the immediate COVID-19 crisis, those who (at personal risk) took care of the sick and kept the economy ticking, are among the worst paid professionals – the nurses, the cleaners, the delivery drivers, the workers in food factories, care homes and warehouses, among others.”"                                                                                            
#> [6] "“How can it be that a person who has spent more than 10 years’ training to become a medical doctor and whose end-of-year “results” are measured in lives receives compensation that is meagre compared to that of a trader or a hedge fund manager?”"                                                                                                                                                                   
#> [7] "“As both an economist and public-health specialist put it: “Only saving lives will save livelihoods”,[23] making it clear that only policy measures that place people’s health at their core will enable an economic recovery, adding: “If governments fail to save lives, people afraid of the virus will not resume shopping, traveling, or dining out. This will hinder economic recovery, lockdown or no lockdown.”"
```
