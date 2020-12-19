

similar_link <- function(raw, x){
    link <- raw %>%
        rvest::html_nodes(".seeMoreLink") %>%
        rvest::html_attr("href")  %>%
        .[1] #%>%
    # paste0("https://www.goodreads.com", .)

    if(is.na(link)){
        message(x)
        message("No similar books found.")
        return(NA)
    }

    return(link)
}

#' @export
gr_similar_books <- function(x, direct = F) {
    # x <- "https://www.goodreads.com/book/show/12158480-why-nations-fail?ac=1&from_search=true&qid=waEu83hPjZ&rank=1"

    raw <- x %>%  xml2::read_html()

    origin_book_url <- x

    if(!direct){

        x <- similar_link(raw, x)

        if(is.na(x)){
            return(NULL)
        } else {
        raw <- x %>%
            xml2::read_html()
        }

    }

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
        rvest::html_text()# %>% paste0(collapse = ", ")

    author_url <- books_html %>%
        rvest::html_nodes(".u-paddingBottomTiny > span:nth-child(2) > span > a")  %>%
        rvest::html_attr("href")# %>% paste0(collapse = ", ")

    avg_rating <- books_html %>%
        purrr::map(~rvest::html_nodes(.x, "[class='gr-metaText']")) %>%
        purrr::map(rvest::html_text) %>%
        purrr::map_chr(~ifelse(length(.x)==0, 0, .x)) %>%
        readr::parse_number()

    reviews <- books_html %>%
        purrr::map(~rvest::html_nodes(.x, ".u-inlineBlock")) %>%
        purrr::map(rvest::html_text) %>%
        purrr::map_chr(~ifelse(length(.x)==0, 0, .x)) %>%
        readr::parse_number()

    book_cover <- books_html %>%
        rvest::html_nodes(".responsiveBook__media") %>%
        rvest::html_nodes(xpath = "a/img") %>%
        rvest::html_attr("src")

    similar_dat <- tibble::tibble(author, author_url, book_title, book_url, avg_rating, reviews, book_cover, origin_book_url)

    return(similar_dat)

}
