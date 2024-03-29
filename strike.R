library(tidyverse)
library(rvest)
library(janitor)  
bbk<-"https://www.baseball-reference.com/leagues/majors/2022-batting-leaders.shtml"
bbk_html<-read_html(bbk) 
bbk_tables <-bbk_html%>%html_table(fill=TRUE)
strikes<-bbk_tables[[20]] 
colnames(strikes)<-c('Rank','Player','Strikeouts')   

write_csv(strikes,paste0('data/',Sys.Date(),'_Strike','.csv'))    
