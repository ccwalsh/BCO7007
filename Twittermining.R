library(tidyverse)
library(rtweet)


cofee_tweets<-search_tweets(
  q = "coffee",
  n = 18000,
  include_rts = FALSE,
  lang = "en", 
  retryonratelimit = TRUE
)


## HOW TO
data<-search_tweets(
  q= "max gawn",
  n=18000,
  include_rts = FALSE,
  lang="en",
  retryonratelimit = TRUE
)

data<-data %>% flatten()


# write and change file name each week
data %>% write.csv("12/10/2021.csv")

# combine files
files<- list.files(pattern = "\\.csv$", full.names = TRUE)

all_data<- map_dt(files, ~read_csv(.x))
## requires same number of columns


## duplicate entires
final_data<- all_data %>% distinct()


## marias example

data<-data%>%flatten()

#change the name of the file
#if you don't you are going to lose your data!!!!

data%>%write_csv("12_10_2021.csv")

#-------------------
#do it when you start completing your assessment
#merging and opening all csv files
files<-list.files(pattern="\\.csv$",full.names = TRUE) #read files names with csv
all_data<-map_df(files, ~read_csv(.x)) #open and merge

#you may have duplicate entries
final_data<-all_data%>%distinct()


