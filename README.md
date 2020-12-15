
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

### Get quotes from a book

``` r
quotes_dat <- gr_quotes("https://www.goodreads.com/book/show/54498122-covid-19") 

quotes_dat
#> # A tibble: 7 x 10
#>   author author_url book_title book_url text  likes hyperlink ratings avg_rating
#>   <chr>  <chr>      <chr>      <chr>    <chr> <dbl> <chr>       <dbl>      <dbl>
#> 1 Klaus~ https://w~ COVID-19:~ https:/~ “His~     0 https://~     190       3.11
#> 2 Klaus~ https://w~ COVID-19:~ https:/~ “How~     0 https://~     190       3.11
#> 3 Klaus~ https://w~ COVID-19:~ https:/~ “The~     0 https://~     190       3.11
#> 4 Klaus~ https://w~ COVID-19:~ https:/~ “Out~     0 https://~     190       3.11
#> 5 Klaus~ https://w~ COVID-19:~ https:/~ “The~     0 https://~     190       3.11
#> 6 Klaus~ https://w~ COVID-19:~ https:/~ “How~     0 https://~     190       3.11
#> 7 Klaus~ https://w~ COVID-19:~ https:/~ “As ~     0 https://~     190       3.11
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

### Get Similar Books

``` r

similar_dat <- gr_similar_books("https://www.goodreads.com/book/show/54498122-covid-19")

similar_dat
#> # A tibble: 30 x 7
#>    author  author_url   book_title    book_url   avg_rating reviews book_cover  
#>    <chr>   <chr>        <chr>         <chr>           <dbl>   <dbl> <chr>       
#>  1 Richar~ https://www~ The COVID-19~ https://w~       4        129 https://i.g~
#>  2 Fareed~ https://www~ Ten Lessons ~ https://w~       4.07     659 https://i.g~
#>  3 Eric D~ https://www~ The Midnight~ https://w~       3.88      33 https://i.g~
#>  4 Adam K~ https://www~ The Rules of~ https://w~       3.84     677 https://i.g~
#>  5 Orhan ~ https://www~ Kirmizi Saçl~ https://w~       3.71    6116 https://i.g~
#>  6 Debora~ https://www~ COVID-19: Th~ https://w~       4.05     229 https://i.g~
#>  7 Aaron ~ https://www~ Fully Automa~ https://w~       3.71     643 https://i.g~
#>  8 Robert~ https://www~ The Ride of ~ https://w~       4.36   26415 https://i.g~
#>  9 Daniel~ https://www~ Drive: The S~ https://w~       3.94   88118 https://i.g~
#> 10 Rutger~ https://www~ Humankind: A~ https://w~       4.41    3155 https://i.g~
#> # ... with 20 more rows
```

``` r
similar_dat$book_title
#>  [1] "The COVID-19 Catastrophe: What's Gone Wrong and How to Stop It Happening Again"                                                                       
#>  [2] "Ten Lessons for a Post-Pandemic World"                                                                                                                
#>  [3] "The Midnight Ground (Adrian Hartworth Book 1)"                                                                                                        
#>  [4] "The Rules of Contagion: Why Things Spread - and Why They Stop"                                                                                        
#>  [5] "Kirmizi Saçli Kadin"                                                                                                                                  
#>  [6] "COVID-19: The Pandemic that Never Should Have Happened and How to Stop the Next One"                                                                  
#>  [7] "Fully Automated Luxury Communism: A Manifesto"                                                                                                        
#>  [8] "The Ride of a Lifetime: Lessons Learned from 15 Years as CEO of the Walt Disney Company"                                                              
#>  [9] "Drive: The Surprising Truth About What Motivates Us"                                                                                                  
#> [10] "Humankind: A Hopeful History"                                                                                                                         
#> [11] "Propaganda"                                                                                                                                           
#> [12] "Irreversible Damage: The Transgender Craze Seducing Our Daughters"                                                                                    
#> [13] "This One Wild and Precious Life: A hopeful path forward in a fractured world"                                                                         
#> [14] "Start with Why: How Great Leaders Inspire Everyone to Take Action"                                                                                    
#> [15] "The RichardsPens Guide to Fountain Pens, Volume 2: Restoration"                                                                                       
#> [16] "The Invisible Rainbow: A History of Electricity and Life"                                                                                             
#> [17] "Unnatural Causes: The Life and Many Deaths of Britain's Top Forensic Pathologist"                                                                     
#> [18] "Flow: The Psychology of Optimal Experience"                                                                                                           
#> [19] "Unreported Truths about COVID-19 and Lockdowns: Part 2: Update and Examination of Lockdowns as a Strategy"                                            
#> [20] "High Performance Habits: How Extraordinary People Become That Way"                                                                                    
#> [21] "Science in the Soul: Selected Writings of a Passionate Rationalist"                                                                                   
#> [22] "The 10x Rule: The Only Difference Between Success and Failure"                                                                                        
#> [23] "Nomadland: Surviving America in the Twenty-First Century"                                                                                             
#> [24] "Talking to My Daughter About the Economy: or, How Capitalism Works - and How It Fails"                                                                
#> [25] "The Kiss Quotient (The Kiss Quotient, #1)"                                                                                                            
#> [26] "Big Friendship: How We Keep Each Other Close"                                                                                                         
#> [27] "The Discomfort of Evening"                                                                                                                            
#> [28] "INTERMITTENT FASTING FOR WOMEN OVER 50: The Ultimate Guide to Accelerate Weight Loss, Reset your Metabolism, Increase your Energy and Detox your Body"
#> [29] "How Will You Measure Your Life?"                                                                                                                      
#> [30] "The First 90 Days: Critical Success Strategies for New Leaders at All Levels"
```
