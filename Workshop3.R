library(tidyverse)
library(tidytext)
library(janeaustenr)

books<-austen_books()

books2_tokens<-books %>% unnest_tokens(word, text)
BOOK_WORDS<-books2_tokens %>% 
  count(book,word, sort = TRUE)
  
total_words<-BOOK_WORDS %>% 
  group_by(book) %>% 
  summarise(total = sum(n))

data_joint<-left_join(BOOK_WORDS, total_words)
