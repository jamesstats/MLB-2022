library(tidyverse)
library(rvest)
library(janitor)  
library(jsonlite)
bbk<-"https://www.baseball-reference.com/leagues/majors/2022-batting-leaders.shtml"
bbk_html<-read_html(bbk) 
bbk_tables <-bbk_html%>%html_table(fill=TRUE)
strikes<-bbk_tables[[20]] 
colnames(strikes)<-c('Rank','Player','Strikeouts')
view(strikes) 
bbkk<-toJSON(strikes)
write_json(bbkk, "srikeouts.json", pretty=TRUE, auto_unbox=FALSE)   

write(bbkk,paste0('data/strikes.json',Sys.Date(),'_Strike','.json'))    
