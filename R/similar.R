

#' @export
gr_similar_books <- function(x) {
    raw <- x %>%  xml2::read_html()

    books_html <- raw %>%
        rvest::html_nodes(".listWithDividers__item") %>%
        .[-1]

    book_title <- books_html %>%
        rvest::html_nodes(".u-paddingBottomXSmall > a > span") %>% rvest::html_text()

    book_url <- books_html %>%
        rvest::html_nodes(".u-paddingBottomXSmall > a") %>%
        rvest::html_attr("href") %>%
        paste0("https://www.goodreads.com", .)

    author <- books_html %>%
        rvest::html_nodes(".u-paddingBottomTiny > span:nth-child(2)") %>%
        rvest::html_text()

    author_url <- books_html %>%
        rvest::html_nodes(".u-paddingBottomTiny > span:nth-child(2) > span > a")  %>%
        rvest::html_attr("href")

    avg_rating <- books_html %>%
        rvest::html_nodes("[class='gr-metaText']") %>%
        rvest::html_text() %>%
        readr::parse_number()

    reviews <- books_html %>%
        rvest::html_nodes(".u-inlineBlock") %>%
        rvest::html_text() %>%
        readr::parse_number()

    book_cover <- books_html %>%
        rvest::html_nodes(".responsiveBook__media") %>%
        rvest::html_nodes(xpath = "a/img") %>%
        rvest::html_attr("src")

    similar_dat <- tibble::tibble(author, author_url, book_title, book_url, avg_rating, reviews, book_cover)

    return(similar_dat)

}
