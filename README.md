
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
books_dat <- gr_books("https://www.goodreads.com/book/show/54498122-covid-19") 

books_dat
#> # A tibble: 1 x 12
#>   author author_url book_title book_url descr avg_rating reviews ratings
#>   <chr>  <chr>      <chr>      <chr>    <lgl>      <dbl>   <dbl>   <dbl>
#> 1 Klaus~ https://w~ COVID-19:~ https:/~ NA          3.05      61     208
#> # ... with 4 more variables: book_cover <chr>, quotes_url <chr>,
#> #   similar_books_url <chr>, genre_url <chr>
```

### Get quotes from a book

``` r
quotes_dat <- gr_quotes("https://www.goodreads.com/book/show/54498122-covid-19") 

quotes_dat
#> # A tibble: 8 x 10
#>   author author_url book_title book_url text  likes hyperlink ratings avg_rating
#>   <chr>  <chr>      <chr>      <chr>    <chr> <dbl> <chr>       <dbl>      <dbl>
#> 1 Klaus~ https://w~ COVID-19:~ https:/~ “was~     0 https://~     208       3.05
#> 2 Klaus~ https://w~ COVID-19:~ https:/~ “His~     0 https://~     208       3.05
#> 3 Klaus~ https://w~ COVID-19:~ https:/~ “How~     0 https://~     208       3.05
#> 4 Klaus~ https://w~ COVID-19:~ https:/~ “The~     0 https://~     208       3.05
#> 5 Klaus~ https://w~ COVID-19:~ https:/~ “Out~     0 https://~     208       3.05
#> 6 Klaus~ https://w~ COVID-19:~ https:/~ “The~     0 https://~     208       3.05
#> 7 Klaus~ https://w~ COVID-19:~ https:/~ “How~     0 https://~     208       3.05
#> 8 Klaus~ https://w~ COVID-19:~ https:/~ “As ~     0 https://~     208       3.05
#> # ... with 1 more variable: reviews <dbl>
```

``` r
quotes_dat$text
#> [1] "“was zero in 1914; a year after the end of World War I, it was 50%. Canada introduced income tax in 1917 as a “temporary” measure to finance the war, and then expanded it dramatically during World War II with a flat 20% surtax imposed on all income tax payable by persons other than corporations and the”"                                                                                                       
#> [2] "“History shows that epidemics have been the great resetter of countries’ economy and social fabric. Why should it be different with COVID-19?”"                                                                                                                                                                                                                                                                         
#> [3] "“How can the US administration, for example, accept that 97% of antibiotics supplied in the country come from China?”"                                                                                                                                                                                                                                                                                                  
#> [4] "“They will also agree with Winston Churchill, who once observed that the US has an innate capability to learn from its mistakes when he remarked that the US always did the right thing when all the alternatives have been exhausted.”"                                                                                                                                                                                
#> [5] "“Outright collapse is not an outlandish scenario for petrostates like Ecuador or Venezuela, where the virus could overwhelm the countries’ few functioning hospitals very quickly.”"                                                                                                                                                                                                                                    
#> [6] "“The sobering truth is that the heroes of the immediate COVID-19 crisis, those who (at personal risk) took care of the sick and kept the economy ticking, are among the worst paid professionals – the nurses, the cleaners, the delivery drivers, the workers in food factories, care homes and warehouses, among others.”"                                                                                            
#> [7] "“How can it be that a person who has spent more than 10 years’ training to become a medical doctor and whose end-of-year “results” are measured in lives receives compensation that is meagre compared to that of a trader or a hedge fund manager?”"                                                                                                                                                                   
#> [8] "“As both an economist and public-health specialist put it: “Only saving lives will save livelihoods”,[23] making it clear that only policy measures that place people’s health at their core will enable an economic recovery, adding: “If governments fail to save lives, people afraid of the virus will not resume shopping, traveling, or dining out. This will hinder economic recovery, lockdown or no lockdown.”"
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
#>  3 Karina R~ https://www~ Ten Lessons~ https://w~       4.07     707 https://i.~
#>  4 Karina R~ https://www~ Kirmizi Saç~ https://w~       3.71    6127 https://i.~
#>  5 Karina R~ https://www~ The Demon i~ https://w~       4.08     242 https://i.~
#>  6 Karina R~ https://www~ The Midnigh~ https://w~       3.88      33 https://i.~
#>  7 Karina R~ https://www~ The Ride of~ https://w~       4.36   26689 https://i.~
#>  8 Karina R~ https://www~ Drive: The ~ https://w~       3.94   88234 https://i.~
#>  9 Karina R~ https://www~ Fully Autom~ https://w~       3.71     651 https://i.~
#> 10 Karina R~ https://www~ Humankind: ~ https://w~       4.41    3226 https://i.~
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

### Get Book genres

``` r

genre_dat <- gr_genres("https://www.goodreads.com/book/show/3.Harry_Potter_and_the_Sorcerer_s_Stone")
#> https://www.goodreads.com/book/shelves/3.Harry_Potter_and_the_Sorcerer_s_Stone
#> This book has more than 10 genre pages (959). By default only the first 10 pages will be scraped.

genre_dat
#> # A tibble: 1,000 x 3
#>    book_url                                            genre        genre_raters
#>    <chr>                                               <chr>               <dbl>
#>  1 https://www.goodreads.com/book/show/3.Harry_Potter~ to-read           1009250
#>  2 https://www.goodreads.com/book/show/3.Harry_Potter~ currently-r~       151642
#>  3 https://www.goodreads.com/book/show/3.Harry_Potter~ fantasy             62462
#>  4 https://www.goodreads.com/book/show/3.Harry_Potter~ favorites           56832
#>  5 https://www.goodreads.com/book/show/3.Harry_Potter~ fiction             18715
#>  6 https://www.goodreads.com/book/show/3.Harry_Potter~ young-adult         18506
#>  7 https://www.goodreads.com/book/show/3.Harry_Potter~ harry-potter        11628
#>  8 https://www.goodreads.com/book/show/3.Harry_Potter~ own                 10091
#>  9 https://www.goodreads.com/book/show/3.Harry_Potter~ books-i-own          9975
#> 10 https://www.goodreads.com/book/show/3.Harry_Potter~ owned                9549
#> # ... with 990 more rows
```

``` r
genre_dat$genre
#>    [1] "to-read"               "currently-reading"     "fantasy"              
#>    [4] "favorites"             "fiction"               "young-adult"          
#>    [7] "harry-potter"          "own"                   "books-i-own"          
#>   [10] "owned"                 "ya"                    "series"               
#>   [13] "favourites"            "magic"                 "childrens"            
#>   [16] "2020"                  "re-read"               "2018"                 
#>   [19] "2019"                  "middle-grade"          "2016"                 
#>   [22] "2017"                  "adventure"             "children"             
#>   [25] "classics"              "owned-books"           "audiobook"            
#>   [28] "audiobooks"            "2015"                  "reread"               
#>   [31] "childhood"             "children-s"            "all-time-favorites"   
#>   [34] "sci-fi-fantasy"        "my-books"              "2014"                 
#>   [37] "j-k-rowling"           "5-stars"               "kids"                 
#>   [40] "children-s-books"      "novels"                "favorite-books"       
#>   [43] "default"               "my-library"            "favorite"             
#>   [46] "audio"                 "2013"                  "re-reads"             
#>   [49] "ya-fantasy"            "fantasy-sci-fi"        "i-own"                
#>   [52] "english"               "books"                 "library"              
#>   [55] "paranormal"            "read-more-than-once"   "read-in-2016"         
#>   [58] "read-in-2017"          "urban-fantasy"         "witches"              
#>   [61] "read-in-2018"          "childrens-books"       "mystery"              
#>   [64] "2012"                  "read-in-2020"          "read-in-2019"         
#>   [67] "british"               "novel"                 "kindle"               
#>   [70] "2011"                  "faves"                 "rereads"              
#>   [73] "favorite-series"       "teen"                  "childhood-favorites"  
#>   [76] "read-in-2015"          "my-favorites"          "ya-fiction"           
#>   [79] "bookshelf"             "audio-books"           "audible"              
#>   [82] "jk-rowling"            "supernatural"          "kids-books"           
#>   [85] "on-my-shelf"           "read-in-english"       "harry-potter-series"  
#>   [88] "ebook"                 "classic"               "my-bookshelf"         
#>   [91] "own-it"                "favs"                  "fantasia"             
#>   [94] "scifi-fantasy"         "re-reading"            "juvenile"             
#>   [97] "children-s-literature" "favourite"             "all-time-favourites"  
#>  [100] "read-in-2014"          "to-read"               "currently-reading"    
#>  [103] "fantasy"               "favorites"             "fiction"              
#>  [106] "young-adult"           "harry-potter"          "own"                  
#>  [109] "books-i-own"           "owned"                 "ya"                   
#>  [112] "series"                "favourites"            "magic"                
#>  [115] "childrens"             "2020"                  "re-read"              
#>  [118] "2018"                  "2019"                  "middle-grade"         
#>  [121] "2016"                  "2017"                  "adventure"            
#>  [124] "children"              "classics"              "owned-books"          
#>  [127] "audiobook"             "audiobooks"            "2015"                 
#>  [130] "reread"                "childhood"             "children-s"           
#>  [133] "all-time-favorites"    "sci-fi-fantasy"        "my-books"             
#>  [136] "2014"                  "j-k-rowling"           "5-stars"              
#>  [139] "kids"                  "children-s-books"      "novels"               
#>  [142] "favorite-books"        "default"               "my-library"           
#>  [145] "favorite"              "audio"                 "2013"                 
#>  [148] "re-reads"              "ya-fantasy"            "fantasy-sci-fi"       
#>  [151] "i-own"                 "english"               "books"                
#>  [154] "library"               "paranormal"            "read-more-than-once"  
#>  [157] "read-in-2016"          "read-in-2017"          "urban-fantasy"        
#>  [160] "witches"               "read-in-2018"          "childrens-books"      
#>  [163] "mystery"               "2012"                  "read-in-2020"         
#>  [166] "read-in-2019"          "british"               "novel"                
#>  [169] "kindle"                "2011"                  "faves"                
#>  [172] "rereads"               "favorite-series"       "teen"                 
#>  [175] "childhood-favorites"   "read-in-2015"          "my-favorites"         
#>  [178] "ya-fiction"            "bookshelf"             "audio-books"          
#>  [181] "audible"               "jk-rowling"            "supernatural"         
#>  [184] "kids-books"            "on-my-shelf"           "read-in-english"      
#>  [187] "harry-potter-series"   "ebook"                 "classic"              
#>  [190] "my-bookshelf"          "own-it"                "favs"                 
#>  [193] "fantasia"              "scifi-fantasy"         "re-reading"           
#>  [196] "juvenile"              "children-s-literature" "favourite"            
#>  [199] "all-time-favourites"   "read-in-2014"          "to-read"              
#>  [202] "currently-reading"     "fantasy"               "favorites"            
#>  [205] "fiction"               "young-adult"           "harry-potter"         
#>  [208] "own"                   "books-i-own"           "owned"                
#>  [211] "ya"                    "series"                "favourites"           
#>  [214] "magic"                 "childrens"             "2020"                 
#>  [217] "re-read"               "2018"                  "2019"                 
#>  [220] "middle-grade"          "2016"                  "2017"                 
#>  [223] "adventure"             "children"              "classics"             
#>  [226] "owned-books"           "audiobook"             "audiobooks"           
#>  [229] "2015"                  "reread"                "childhood"            
#>  [232] "children-s"            "all-time-favorites"    "sci-fi-fantasy"       
#>  [235] "my-books"              "2014"                  "j-k-rowling"          
#>  [238] "5-stars"               "kids"                  "children-s-books"     
#>  [241] "novels"                "favorite-books"        "default"              
#>  [244] "my-library"            "favorite"              "audio"                
#>  [247] "2013"                  "re-reads"              "ya-fantasy"           
#>  [250] "fantasy-sci-fi"        "i-own"                 "english"              
#>  [253] "books"                 "library"               "paranormal"           
#>  [256] "read-more-than-once"   "read-in-2016"          "read-in-2017"         
#>  [259] "urban-fantasy"         "witches"               "read-in-2018"         
#>  [262] "childrens-books"       "mystery"               "2012"                 
#>  [265] "read-in-2020"          "read-in-2019"          "british"              
#>  [268] "novel"                 "kindle"                "2011"                 
#>  [271] "faves"                 "rereads"               "favorite-series"      
#>  [274] "teen"                  "childhood-favorites"   "read-in-2015"         
#>  [277] "my-favorites"          "ya-fiction"            "bookshelf"            
#>  [280] "audio-books"           "audible"               "jk-rowling"           
#>  [283] "supernatural"          "kids-books"            "on-my-shelf"          
#>  [286] "read-in-english"       "harry-potter-series"   "ebook"                
#>  [289] "classic"               "my-bookshelf"          "own-it"               
#>  [292] "favs"                  "fantasia"              "scifi-fantasy"        
#>  [295] "re-reading"            "juvenile"              "children-s-literature"
#>  [298] "favourite"             "all-time-favourites"   "read-in-2014"         
#>  [301] "to-read"               "currently-reading"     "fantasy"              
#>  [304] "favorites"             "fiction"               "young-adult"          
#>  [307] "harry-potter"          "own"                   "books-i-own"          
#>  [310] "owned"                 "ya"                    "series"               
#>  [313] "favourites"            "magic"                 "childrens"            
#>  [316] "2020"                  "re-read"               "2018"                 
#>  [319] "2019"                  "middle-grade"          "2016"                 
#>  [322] "2017"                  "adventure"             "children"             
#>  [325] "classics"              "owned-books"           "audiobook"            
#>  [328] "audiobooks"            "2015"                  "reread"               
#>  [331] "childhood"             "children-s"            "all-time-favorites"   
#>  [334] "sci-fi-fantasy"        "my-books"              "2014"                 
#>  [337] "j-k-rowling"           "5-stars"               "kids"                 
#>  [340] "children-s-books"      "novels"                "favorite-books"       
#>  [343] "default"               "my-library"            "favorite"             
#>  [346] "audio"                 "2013"                  "re-reads"             
#>  [349] "ya-fantasy"            "fantasy-sci-fi"        "i-own"                
#>  [352] "english"               "books"                 "library"              
#>  [355] "paranormal"            "read-more-than-once"   "read-in-2016"         
#>  [358] "read-in-2017"          "urban-fantasy"         "witches"              
#>  [361] "read-in-2018"          "childrens-books"       "mystery"              
#>  [364] "2012"                  "read-in-2020"          "read-in-2019"         
#>  [367] "british"               "novel"                 "kindle"               
#>  [370] "2011"                  "faves"                 "rereads"              
#>  [373] "favorite-series"       "teen"                  "childhood-favorites"  
#>  [376] "read-in-2015"          "my-favorites"          "ya-fiction"           
#>  [379] "bookshelf"             "audio-books"           "audible"              
#>  [382] "jk-rowling"            "supernatural"          "kids-books"           
#>  [385] "on-my-shelf"           "read-in-english"       "harry-potter-series"  
#>  [388] "ebook"                 "classic"               "my-bookshelf"         
#>  [391] "own-it"                "favs"                  "fantasia"             
#>  [394] "scifi-fantasy"         "re-reading"            "juvenile"             
#>  [397] "children-s-literature" "favourite"             "all-time-favourites"  
#>  [400] "read-in-2014"          "to-read"               "currently-reading"    
#>  [403] "fantasy"               "favorites"             "fiction"              
#>  [406] "young-adult"           "harry-potter"          "own"                  
#>  [409] "books-i-own"           "owned"                 "ya"                   
#>  [412] "series"                "favourites"            "magic"                
#>  [415] "childrens"             "2020"                  "re-read"              
#>  [418] "2018"                  "2019"                  "middle-grade"         
#>  [421] "2016"                  "2017"                  "adventure"            
#>  [424] "children"              "classics"              "owned-books"          
#>  [427] "audiobook"             "audiobooks"            "2015"                 
#>  [430] "reread"                "childhood"             "children-s"           
#>  [433] "all-time-favorites"    "sci-fi-fantasy"        "my-books"             
#>  [436] "2014"                  "j-k-rowling"           "5-stars"              
#>  [439] "kids"                  "children-s-books"      "novels"               
#>  [442] "favorite-books"        "default"               "my-library"           
#>  [445] "favorite"              "audio"                 "2013"                 
#>  [448] "re-reads"              "ya-fantasy"            "fantasy-sci-fi"       
#>  [451] "i-own"                 "english"               "books"                
#>  [454] "library"               "paranormal"            "read-more-than-once"  
#>  [457] "read-in-2016"          "read-in-2017"          "urban-fantasy"        
#>  [460] "witches"               "read-in-2018"          "childrens-books"      
#>  [463] "mystery"               "2012"                  "read-in-2020"         
#>  [466] "read-in-2019"          "british"               "novel"                
#>  [469] "kindle"                "2011"                  "faves"                
#>  [472] "rereads"               "favorite-series"       "teen"                 
#>  [475] "childhood-favorites"   "read-in-2015"          "my-favorites"         
#>  [478] "ya-fiction"            "bookshelf"             "audio-books"          
#>  [481] "audible"               "jk-rowling"            "supernatural"         
#>  [484] "kids-books"            "on-my-shelf"           "read-in-english"      
#>  [487] "harry-potter-series"   "ebook"                 "classic"              
#>  [490] "my-bookshelf"          "own-it"                "favs"                 
#>  [493] "fantasia"              "scifi-fantasy"         "re-reading"           
#>  [496] "juvenile"              "children-s-literature" "favourite"            
#>  [499] "all-time-favourites"   "read-in-2014"          "to-read"              
#>  [502] "currently-reading"     "fantasy"               "favorites"            
#>  [505] "fiction"               "young-adult"           "harry-potter"         
#>  [508] "own"                   "books-i-own"           "owned"                
#>  [511] "ya"                    "series"                "favourites"           
#>  [514] "magic"                 "childrens"             "2020"                 
#>  [517] "re-read"               "2018"                  "2019"                 
#>  [520] "middle-grade"          "2016"                  "2017"                 
#>  [523] "adventure"             "children"              "classics"             
#>  [526] "owned-books"           "audiobook"             "audiobooks"           
#>  [529] "2015"                  "reread"                "childhood"            
#>  [532] "children-s"            "all-time-favorites"    "sci-fi-fantasy"       
#>  [535] "my-books"              "2014"                  "j-k-rowling"          
#>  [538] "5-stars"               "kids"                  "children-s-books"     
#>  [541] "novels"                "favorite-books"        "default"              
#>  [544] "my-library"            "favorite"              "audio"                
#>  [547] "2013"                  "re-reads"              "ya-fantasy"           
#>  [550] "fantasy-sci-fi"        "i-own"                 "english"              
#>  [553] "books"                 "library"               "paranormal"           
#>  [556] "read-more-than-once"   "read-in-2016"          "read-in-2017"         
#>  [559] "urban-fantasy"         "witches"               "read-in-2018"         
#>  [562] "childrens-books"       "mystery"               "2012"                 
#>  [565] "read-in-2020"          "read-in-2019"          "british"              
#>  [568] "novel"                 "kindle"                "2011"                 
#>  [571] "faves"                 "rereads"               "favorite-series"      
#>  [574] "teen"                  "childhood-favorites"   "read-in-2015"         
#>  [577] "my-favorites"          "ya-fiction"            "bookshelf"            
#>  [580] "audio-books"           "audible"               "jk-rowling"           
#>  [583] "supernatural"          "kids-books"            "on-my-shelf"          
#>  [586] "read-in-english"       "harry-potter-series"   "ebook"                
#>  [589] "classic"               "my-bookshelf"          "own-it"               
#>  [592] "favs"                  "fantasia"              "scifi-fantasy"        
#>  [595] "re-reading"            "juvenile"              "children-s-literature"
#>  [598] "favourite"             "all-time-favourites"   "read-in-2014"         
#>  [601] "to-read"               "currently-reading"     "fantasy"              
#>  [604] "favorites"             "fiction"               "young-adult"          
#>  [607] "harry-potter"          "own"                   "books-i-own"          
#>  [610] "owned"                 "ya"                    "series"               
#>  [613] "favourites"            "magic"                 "childrens"            
#>  [616] "2020"                  "re-read"               "2018"                 
#>  [619] "2019"                  "middle-grade"          "2016"                 
#>  [622] "2017"                  "adventure"             "children"             
#>  [625] "classics"              "owned-books"           "audiobook"            
#>  [628] "audiobooks"            "2015"                  "reread"               
#>  [631] "childhood"             "children-s"            "all-time-favorites"   
#>  [634] "sci-fi-fantasy"        "my-books"              "2014"                 
#>  [637] "j-k-rowling"           "5-stars"               "kids"                 
#>  [640] "children-s-books"      "novels"                "favorite-books"       
#>  [643] "default"               "my-library"            "favorite"             
#>  [646] "audio"                 "2013"                  "re-reads"             
#>  [649] "ya-fantasy"            "fantasy-sci-fi"        "i-own"                
#>  [652] "english"               "books"                 "library"              
#>  [655] "paranormal"            "read-more-than-once"   "read-in-2016"         
#>  [658] "read-in-2017"          "urban-fantasy"         "witches"              
#>  [661] "read-in-2018"          "childrens-books"       "mystery"              
#>  [664] "2012"                  "read-in-2020"          "read-in-2019"         
#>  [667] "british"               "novel"                 "kindle"               
#>  [670] "2011"                  "faves"                 "rereads"              
#>  [673] "favorite-series"       "teen"                  "childhood-favorites"  
#>  [676] "read-in-2015"          "my-favorites"          "ya-fiction"           
#>  [679] "bookshelf"             "audio-books"           "audible"              
#>  [682] "jk-rowling"            "supernatural"          "kids-books"           
#>  [685] "on-my-shelf"           "read-in-english"       "harry-potter-series"  
#>  [688] "ebook"                 "classic"               "my-bookshelf"         
#>  [691] "own-it"                "favs"                  "fantasia"             
#>  [694] "scifi-fantasy"         "re-reading"            "juvenile"             
#>  [697] "children-s-literature" "favourite"             "all-time-favourites"  
#>  [700] "read-in-2014"          "to-read"               "currently-reading"    
#>  [703] "fantasy"               "favorites"             "fiction"              
#>  [706] "young-adult"           "harry-potter"          "own"                  
#>  [709] "books-i-own"           "owned"                 "ya"                   
#>  [712] "series"                "favourites"            "magic"                
#>  [715] "childrens"             "2020"                  "re-read"              
#>  [718] "2018"                  "2019"                  "middle-grade"         
#>  [721] "2016"                  "2017"                  "adventure"            
#>  [724] "children"              "classics"              "owned-books"          
#>  [727] "audiobook"             "audiobooks"            "2015"                 
#>  [730] "reread"                "childhood"             "children-s"           
#>  [733] "all-time-favorites"    "sci-fi-fantasy"        "my-books"             
#>  [736] "2014"                  "j-k-rowling"           "5-stars"              
#>  [739] "kids"                  "children-s-books"      "novels"               
#>  [742] "favorite-books"        "default"               "my-library"           
#>  [745] "favorite"              "audio"                 "2013"                 
#>  [748] "re-reads"              "ya-fantasy"            "fantasy-sci-fi"       
#>  [751] "i-own"                 "english"               "books"                
#>  [754] "library"               "paranormal"            "read-more-than-once"  
#>  [757] "read-in-2016"          "read-in-2017"          "urban-fantasy"        
#>  [760] "witches"               "read-in-2018"          "childrens-books"      
#>  [763] "mystery"               "2012"                  "read-in-2020"         
#>  [766] "read-in-2019"          "british"               "novel"                
#>  [769] "kindle"                "2011"                  "faves"                
#>  [772] "rereads"               "favorite-series"       "teen"                 
#>  [775] "childhood-favorites"   "read-in-2015"          "my-favorites"         
#>  [778] "ya-fiction"            "bookshelf"             "audio-books"          
#>  [781] "audible"               "jk-rowling"            "supernatural"         
#>  [784] "kids-books"            "on-my-shelf"           "read-in-english"      
#>  [787] "harry-potter-series"   "ebook"                 "classic"              
#>  [790] "my-bookshelf"          "own-it"                "favs"                 
#>  [793] "fantasia"              "scifi-fantasy"         "re-reading"           
#>  [796] "juvenile"              "children-s-literature" "favourite"            
#>  [799] "all-time-favourites"   "read-in-2014"          "to-read"              
#>  [802] "currently-reading"     "fantasy"               "favorites"            
#>  [805] "fiction"               "young-adult"           "harry-potter"         
#>  [808] "own"                   "books-i-own"           "owned"                
#>  [811] "ya"                    "series"                "favourites"           
#>  [814] "magic"                 "childrens"             "2020"                 
#>  [817] "re-read"               "2018"                  "2019"                 
#>  [820] "middle-grade"          "2016"                  "2017"                 
#>  [823] "adventure"             "children"              "classics"             
#>  [826] "owned-books"           "audiobook"             "audiobooks"           
#>  [829] "2015"                  "reread"                "childhood"            
#>  [832] "children-s"            "all-time-favorites"    "sci-fi-fantasy"       
#>  [835] "my-books"              "2014"                  "j-k-rowling"          
#>  [838] "5-stars"               "kids"                  "children-s-books"     
#>  [841] "novels"                "favorite-books"        "default"              
#>  [844] "my-library"            "favorite"              "audio"                
#>  [847] "2013"                  "re-reads"              "ya-fantasy"           
#>  [850] "fantasy-sci-fi"        "i-own"                 "english"              
#>  [853] "books"                 "library"               "paranormal"           
#>  [856] "read-more-than-once"   "read-in-2016"          "read-in-2017"         
#>  [859] "urban-fantasy"         "witches"               "read-in-2018"         
#>  [862] "childrens-books"       "mystery"               "2012"                 
#>  [865] "read-in-2020"          "read-in-2019"          "british"              
#>  [868] "novel"                 "kindle"                "2011"                 
#>  [871] "faves"                 "rereads"               "favorite-series"      
#>  [874] "teen"                  "childhood-favorites"   "read-in-2015"         
#>  [877] "my-favorites"          "ya-fiction"            "bookshelf"            
#>  [880] "audio-books"           "audible"               "jk-rowling"           
#>  [883] "supernatural"          "kids-books"            "on-my-shelf"          
#>  [886] "read-in-english"       "harry-potter-series"   "ebook"                
#>  [889] "classic"               "my-bookshelf"          "own-it"               
#>  [892] "favs"                  "fantasia"              "scifi-fantasy"        
#>  [895] "re-reading"            "juvenile"              "children-s-literature"
#>  [898] "favourite"             "all-time-favourites"   "read-in-2014"         
#>  [901] "to-read"               "currently-reading"     "fantasy"              
#>  [904] "favorites"             "fiction"               "young-adult"          
#>  [907] "harry-potter"          "own"                   "books-i-own"          
#>  [910] "owned"                 "ya"                    "series"               
#>  [913] "favourites"            "magic"                 "childrens"            
#>  [916] "2020"                  "re-read"               "2018"                 
#>  [919] "2019"                  "middle-grade"          "2016"                 
#>  [922] "2017"                  "adventure"             "children"             
#>  [925] "classics"              "owned-books"           "audiobook"            
#>  [928] "audiobooks"            "2015"                  "reread"               
#>  [931] "childhood"             "children-s"            "all-time-favorites"   
#>  [934] "sci-fi-fantasy"        "my-books"              "2014"                 
#>  [937] "j-k-rowling"           "5-stars"               "kids"                 
#>  [940] "children-s-books"      "novels"                "favorite-books"       
#>  [943] "default"               "my-library"            "favorite"             
#>  [946] "audio"                 "2013"                  "re-reads"             
#>  [949] "ya-fantasy"            "fantasy-sci-fi"        "i-own"                
#>  [952] "english"               "books"                 "library"              
#>  [955] "paranormal"            "read-more-than-once"   "read-in-2016"         
#>  [958] "read-in-2017"          "urban-fantasy"         "witches"              
#>  [961] "read-in-2018"          "childrens-books"       "mystery"              
#>  [964] "2012"                  "read-in-2020"          "read-in-2019"         
#>  [967] "british"               "novel"                 "kindle"               
#>  [970] "2011"                  "faves"                 "rereads"              
#>  [973] "favorite-series"       "teen"                  "childhood-favorites"  
#>  [976] "read-in-2015"          "my-favorites"          "ya-fiction"           
#>  [979] "bookshelf"             "audio-books"           "audible"              
#>  [982] "jk-rowling"            "supernatural"          "kids-books"           
#>  [985] "on-my-shelf"           "read-in-english"       "harry-potter-series"  
#>  [988] "ebook"                 "classic"               "my-bookshelf"         
#>  [991] "own-it"                "favs"                  "fantasia"             
#>  [994] "scifi-fantasy"         "re-reading"            "juvenile"             
#>  [997] "children-s-literature" "favourite"             "all-time-favourites"  
#> [1000] "read-in-2014"
```
