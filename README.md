
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

You can install the development version of goodreadr from this
repository with:

``` r
devtools::install_github("favstats/goodreadr")
```

## Examples

``` r
library(goodreadr)
## basic example code
```

### Get book stats

``` r
# debugonce(gr_books)

books_dat <- gr_books("https://www.goodreads.com/book/show/54498122-covid-19") 

books_dat
#> # A tibble: 1 x 9
#>   author author_url book_title book_url descr avg_rating reviews ratings
#>   <chr>  <chr>      <chr>      <chr>    <lgl>      <dbl>   <dbl>   <dbl>
#> 1 Klaus~ https://w~ COVID-19:~ https:/~ NA          3.05      60     208
#> # ... with 1 more variable: book_cover <chr>
```

### Get quotes from a book

``` r
quotes_dat <- gr_quotes("https://www.goodreads.com/book/show/54498122-covid-19") 
#> https://www.goodreads.com/book/show/54498122-covid-19
#> No quotes found.

quotes_dat
#> NULL
```

``` r
quotes_dat$text
#> NULL
```

### Get Similar Books

``` r

similar_dat <- gr_similar_books("https://www.goodreads.com/book/show/54498122-covid-19")

similar_dat
#> # A tibble: 30 x 7
#>    author    author_url   book_title   book_url   avg_rating reviews book_cover 
#>    <chr>     <chr>        <chr>        <chr>           <dbl>   <dbl> <chr>      
#>  1 Karina R~ https://www~ Corona, Fal~ https://w~       4.42     124 https://i.~
#>  2 Karina R~ https://www~ The COVID-1~ https://w~       4        129 https://i.~
#>  3 Karina R~ https://www~ Ten Lessons~ https://w~       4.08     705 https://i.~
#>  4 Karina R~ https://www~ Kirmizi Saç~ https://w~       3.71    6127 https://i.~
#>  5 Karina R~ https://www~ The Demon i~ https://w~       4.08     242 https://i.~
#>  6 Karina R~ https://www~ The Midnigh~ https://w~       3.88      33 https://i.~
#>  7 Karina R~ https://www~ The Ride of~ https://w~       4.36   26683 https://i.~
#>  8 Karina R~ https://www~ Drive: The ~ https://w~       3.94   88231 https://i.~
#>  9 Karina R~ https://www~ Fully Autom~ https://w~       3.71     651 https://i.~
#> 10 Karina R~ https://www~ Humankind: ~ https://w~       4.41    3224 https://i.~
#> # ... with 20 more rows
```

``` r
similar_dat$book_title
#>  [1] "Corona, False Alarm?: Facts and Figures"                                                                                                              
#>  [2] "The COVID-19 Catastrophe: What's Gone Wrong and How to Stop It Happening Again"                                                                       
#>  [3] "Ten Lessons for a Post-Pandemic World"                                                                                                                
#>  [4] "Kirmizi Saçli Kadin"                                                                                                                                  
#>  [5] "The Demon in the Machine: How Hidden Webs of Information Are Solving the Mystery of Life"                                                             
#>  [6] "The Midnight Ground (Adrian Hartworth Book 1)"                                                                                                        
#>  [7] "The Ride of a Lifetime: Lessons Learned from 15 Years as CEO of the Walt Disney Company"                                                              
#>  [8] "Drive: The Surprising Truth About What Motivates Us"                                                                                                  
#>  [9] "Fully Automated Luxury Communism: A Manifesto"                                                                                                        
#> [10] "Humankind: A Hopeful History"                                                                                                                         
#> [11] "The Rules of Contagion: Why Things Spread - and Why They Stop"                                                                                        
#> [12] "COVID-19: The Pandemic that Never Should Have Happened and How to Stop the Next One"                                                                  
#> [13] "Start with Why: How Great Leaders Inspire Everyone to Take Action"                                                                                    
#> [14] "The Contagion Myth: Why Viruses (including \"Coronavirus\") Are Not the Cause of Disease"                                                             
#> [15] "Irreversible Damage: The Transgender Craze Seducing Our Daughters"                                                                                    
#> [16] "Propaganda"                                                                                                                                           
#> [17] "The RichardsPens Guide to Fountain Pens, Volume 2: Restoration"                                                                                       
#> [18] "Unnatural Causes: The Life and Many Deaths of Britain's Top Forensic Pathologist"                                                                     
#> [19] "Flow: The Psychology of Optimal Experience"                                                                                                           
#> [20] "High Performance Habits: How Extraordinary People Become That Way"                                                                                    
#> [21] "Science in the Soul: Selected Writings of a Passionate Rationalist"                                                                                   
#> [22] "The 10x Rule: The Only Difference Between Success and Failure"                                                                                        
#> [23] "This One Wild and Precious Life: A hopeful path forward in a fractured world"                                                                         
#> [24] "Nomadland: Surviving America in the Twenty-First Century"                                                                                             
#> [25] "Talking to My Daughter About the Economy: or, How Capitalism Works - and How It Fails"                                                                
#> [26] "The Kiss Quotient (The Kiss Quotient, #1)"                                                                                                            
#> [27] "Civilized to Death: What Was Lost on the Way to Modernity"                                                                                            
#> [28] "Big Friendship: How We Keep Each Other Close"                                                                                                         
#> [29] "The Discomfort of Evening"                                                                                                                            
#> [30] "INTERMITTENT FASTING FOR WOMEN OVER 50: The Ultimate Guide to Accelerate Weight Loss, Reset your Metabolism, Increase your Energy and Detox your Body"
```
