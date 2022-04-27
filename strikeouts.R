library(tidyverse)
library(rvest)
library(janitor) 
SO <-"https://www.espn.com/mlb/stats/player/_/table/batting/sort/strikeouts/dir/desc"
SO_html <-read_html(SO)
SO_tables <-SO_html%>%html_table(fill=TRUE)
ks_1<-SO_tables[[1]]
ks<-SO_tables[[2]]
mlbtbl<-data.frame(ks_1,ks) 
write_csv(mlbtbl,paste0('data/',Sys.Date(),'_StrikeOuts','.csv'))    
