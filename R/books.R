



#' @export
gr_books <- function(x) {
    # x <- "https://www.goodreads.com/book/show/44665940-qanon-and-the-battle-of-armageddon"

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

    meta_html <- raw %>% rvest::html_nodes("#bookMeta")

    meta_children <- meta_html %>% rvest::html_children()

    avg_rating <- meta_children[meta_children  %>% as.character() %>% stringr::str_detect("ratingValue")] %>%
        rvest::html_text() %>%
        readr::parse_number()

    ratings <- meta_children[meta_children  %>% as.character() %>% stringr::str_detect("ratingCount")] %>%
        rvest::html_text() %>%
        readr::parse_number()

    reviews <- meta_children[meta_children  %>% as.character() %>% stringr::str_detect("reviewCount")] %>%
        rvest::html_text() %>%
        readr::parse_number()


    author_followers <- raw %>% rvest::html_nodes(".bookAuthorProfile__followerCount") %>%
        rvest::html_text() %>%
        readr::parse_number()

    descr <- raw %>% rvest::html_nodes("#description") %>%
        rvest::html_children() %>%
        .[2] %>%
        rvest::html_text()

    if(length(descr)==0) descr <- NA


    book_url <- x

    book_cover <- raw %>% rvest::html_nodes("#coverImage") %>%
        rvest::html_attr("src")


    book_dat <- tibble::tibble(author, author_url, book_title, book_url, descr, avg_rating, reviews, ratings, book_cover)

    return(book_dat)

}
