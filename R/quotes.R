
#' @export
gr_quotes <- function(x, direct = F) {
    raw <- x %>%
        xml2::read_html()

    if(!direct){
        quotes <- raw %>%
            rvest::html_nodes(".bigBoquotesBody > div > a")# %>%

        quotes <- quotes[quotes %>% as.character() %>% stringr::str_detect("quotes")]

        if(length(quotes)==0){
            message(x)
            message("No quotes found.")
            return(NULL)
        }

        x <- quotes %>%
            rvest::html_attr("href")  %>%
            # .[1] #%>%
            paste0("https://www.goodreads.com", .)

        raw <- x %>%  xml2::read_html()
    }

    booktitle_html <- raw %>%
        rvest::html_nodes(".bookTitle")

    book_title <- booktitle_html %>%
        rvest::html_text()

    book_url <- booktitle_html  %>%
        rvest::html_attr("href") %>%
        paste0("https://www.goodreads.com", .)

    author_html <- raw %>%
        rvest::html_nodes(".authorName")

    author <- author_html %>%
        rvest::html_text() %>% paste0(collapse = ", ")

    author_url <- author_html  %>%
        rvest::html_attr("href") %>%
        paste0("https://www.goodreads.com", .) %>% paste0(collapse = ", ")


    ratings_dat <- raw %>% rvest::html_nodes(xpath = "/html/body/div[2]/div[3]/div[1]/div[2]/div[3]/text()[6]") %>%
        rvest::html_text() %>%
        gsub("(\\d),(\\d)", "\\1\\2", ., perl=TRUE) %>%
        stringr::str_split("\n|,") %>%
        unlist() %>%
        stringr::str_replace_all("[[:alpha:]]", "") %>%
        as.numeric() %>%
        na.omit() %>%
        magrittr::set_names(c("ratings", "avg_rating", "reviews")) %>%
        dplyr::bind_rows()




    quotes_html <- raw %>%
        rvest::html_nodes(".quote")

    text <- quotes_html %>%
        rvest::html_nodes(".quoteText") %>%
        purrr::map_chr(~rvest::html_nodes(.x, xpath = "text()[1]") %>% rvest::html_text()) %>%
        stringr::str_remove_all("\n") %>% stringr::str_trim()

    footers <- quotes_html %>%
        rvest::html_nodes(".smallText")

    likes <- footers %>%
        rvest::html_text() %>%
        readr::parse_number()

    hyperlink <- footers %>%
        rvest::html_attr("href") %>%
        paste0("https://www.goodreads.com", .)


    quotes_dat <- tibble::tibble(author, author_url, book_title, book_url, text, likes, hyperlink) %>% dplyr::bind_cols(ratings_dat)

    return(quotes_dat)
}
