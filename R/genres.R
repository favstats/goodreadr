


genre_link <- function(raw, x){

    genres <- raw %>%
        rvest::html_nodes(".bigBoxBody > div > a")# %>%

    genres <- genres[genres %>% as.character() %>% stringr::str_detect("shelves")]

    if(length(genres)==0){
        message(x)
        message("No genres found.")
        return(NA)
    }

    x <- genres %>%
        rvest::html_attr("href")  %>%
        # .[1] #%>%
        paste0("https://www.goodreads.com", .)


    return(x)
}

#' @export
gr_genres <- function(x, direct = F, scrape_pages = NULL) {

    # x <- "https://www.goodreads.com/book/show/54367429-the-great-british-coronavirus-hoax"

    raw <- x %>%
        xml2::read_html()

    book_url <- x

    if(!direct){

        x <- genre_link(raw, x)

        if(is.na(x)){
            return(tibble())
        } else {
            raw <- x %>%
                xml2::read_html()
        }

    }


    pages <- raw %>%
        rvest::html_nodes(".smallText") %>%
        .[1] %>%
        rvest::html_text() %>%
        stringr::str_remove("Showing 1-100 of") %>%
        readr::parse_number() %>%
        magrittr::divide_by(100) %>%
        ceiling()

    if(pages > 10){
        message(x)
        message(paste0("This book has more than 10 genre pages (", pages, "). By default only the first 10 pages will be scraped."))
        if(is.null(scrape_pages)){
            scrape_pages <- 10
        }

    } else {
        scrape_pages <- pages
    }

    page_links <- paste0(x, "?page=", 1:scrape_pages)

    genre_dat <- page_links %>%
        purrr::map_dfr(~{
            raw <- xml2::read_html(.x)

            shelf_html <- raw %>%
                rvest::html_nodes(".shelfStat")

            genre <- shelf_html %>%
                rvest::html_nodes(".mediumText") %>%
                rvest::html_text()

            genre_url <- shelf_html %>%
                rvest::html_nodes(".mediumText") %>%
                rvest::html_attr("href") %>%
                paste0("https://www.goodreads.com", .)


            raters <- shelf_html %>%
                rvest::html_nodes(".smallText") %>%
                rvest::html_text() %>%
                readr::parse_number()


            genre_dat <- tibble::tibble(book_url, genre, genre_url, genre_raters = raters)

            return(genre_dat)
        })

    return(genre_dat)
}
