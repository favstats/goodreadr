
scrape_reviews <- function(review) {
    user_html <- review %>%
        rvest::html_nodes(".user") #%>%

    review_author <- user_html %>%
        rvest::html_text()

    review_author_url <- user_html %>%
        rvest::html_attr("href") %>%
        paste0("https://www.goodreads.com", .)



    review_rating <- review %>%
        rvest::html_nodes(".staticStar") %>%
        as.character() %>%
        stringr::str_detect("p10") %>%
        sum() %>%
        ifelse(. == 0, NA, .)

    review_date <- review %>%
        rvest::html_nodes(".reviewDate") %>%
        rvest::html_text() %>%
        lubridate::mdy()

    review_url <- review %>%
        rvest::html_nodes(".reviewDate") %>%
        rvest::html_attr("href") %>%
        paste0("https://www.goodreads.com", .)


    review_shelves <- review %>%
        rvest::html_nodes(".uitext.greyText a") %>%
        rvest::html_text() %>% paste0(collapse = ", ")

    review_shelves_url <- review %>%
        rvest::html_nodes(".uitext.greyText a") %>%
        rvest::html_attr("href") %>%
        paste0("https://www.goodreads.com", .) %>% paste0(collapse = ", ")


    review_text <- review %>%
        rvest::html_nodes(".reviewText.stacked") %>%
        rvest::html_children() %>%
        rvest::html_children() %>%
        .[stringr::str_detect(as.character(.), "span")]

    if(length(review_text)==0) {
        review_text <- NA
    } else if(length(review_text) == 1){
        review_text <- review_text %>% rvest::html_text()
    } else if (length(review_text) > 1){
        review_text <- review_text %>%
            .[2] %>%
            rvest::html_text()
    }

    review_likes <- review %>%
        rvest::html_nodes(".likesCount") %>%
        rvest::html_text() %>%
        readr::parse_number()


    review_dat <- tibble::tibble(review_author, review_author_url, review_text, review_rating, review_likes, review_date, review_url, review_shelves, review_shelves_url)

    return(review_dat)

}


#' @export
gr_reviews <- function(x, scrape_pages = 10) {
    # x <- "https://www.goodreads.com/book/show/12158480-why-nations-fail?ac=1&from_search=true&qid=waEu83hPjZ&rank=1"

    raw <- x %>%  xml2::read_html()

    book_title <- raw %>% rvest::html_nodes("#bookTitle") %>%
        rvest::html_text() %>%
        stringr::str_remove_all("\n") %>% stringr::str_trim()

    author_html <- raw %>%
        rvest::html_nodes(".authorName")

    author <- author_html %>%
        rvest::html_text() %>% paste0(collapse = ", ")

    author_url <- author_html  %>%
        rvest::html_attr("href") %>% paste0(collapse = ", ")


    book_url <- x
    # review <- review_list %>%
    #     .[1]

    review_list <- raw %>%
        rvest::html_nodes("#bookReviews") %>%
        rvest::html_nodes(".friendReviews")

    reviews <- review_list %>%
        purrr::map_dfr(scrape_reviews)

    # review_website <- read_html(review_url)

    # review_comments <- review_website %>%
    #     rvest::html_nodes(".h2Container.gradientHeaderContainer") %>% #.[2]
    #     .[stringr::str_detect(as.character(.), "Post a comment")] %>%
    #     rvest::html_text() %>%
    #     stringr::str_split(" of ") %>%
    #     unlist() %>%
    #     stringr::str_extract("[[:digit:]]") %>%
    #     paste0(collapse = "") %>%
    #     as.numeric()
    #
    # pages <- review_comments %>%
    #     magrittr::divide_by(10) %>%
    #     ceiling()
    #
    # if(pages > 10){
    #     message(review_url)
    #     message(paste0("This review has more than 10 comment pages (", pages, "). By default only the first 10 pages will be scraped."))
    #     if(is.null(scrape_pages)){
    #         scrape_pages <- 10
    #     }
    #
    # } else {
    #     scrape_pages <- pages
    # }
    #
    # page_links <- paste0(review_url, "&page=", 1:scrape_pages)
    #
    #
    # comment_list <- review_website %>%
    #     rvest::html_nodes(".comment.u-anchorTarget")
    #
    # comment <- comment_list %>%
    #     .[1]
    #
    # comment %>%
    #     rvest::html_nodes(".commentAuthor")

    review_dat <- reviews %>%
        dplyr::mutate(author = author,
                author_url = author_url,
                book_title = book_title,
                book_url = book_url)

    return(review_dat)

}
