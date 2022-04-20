library(tidyverse)
library(rvest)
library(janitor) 
 

SO <-"https://www.mlb.com/stats/strikeouts"
SO_html <-read_html(SO)
SO_tables <-SO_html%>%html_table(fill=TRUE) 
ks<-SO_tables[[1]] 
colnames(ks)<-c('Player','Team','G','AB','R','H','2B','3B','HR','RBI','BB','SO','SB','CS','AVG','OBP','SLG','OPS') 
write_csv(ks,paste0('data/',Sys.Date(),'_StrikeOuts','.csv'))    
