library(tidyverse)
library(rvest)
library(janitor) 
 

SO <-"https://www.mlb.com/stats/strikeouts"
SO_html <-read_html(SO)
SO_tables <-SO_html%>%html_table(fill=TRUE) 
ks<-SO_tables[[1]] 

write_csv(ks,paste0('data/',Sys.Date(),'_StrikeOuts','.csv'))    
