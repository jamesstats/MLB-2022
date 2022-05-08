library(tidyverse)
library(rvest)
library(janitor)

links <-"https://www.espn.com/mlb/stats/player/_/table/batting/sort/strikeouts/dir/desc"
strikes_html <-read_html(links)
strikes_tables <-strikes_html%>%html_table(fill=TRUE)
strikes_1<-strikes_tables[[1]]
strikes_2<-strikes_tables[[2]]
mlbtbl<-data.frame(strikes_1,strikes_2)  

leaders <-mlbtbl%>%
  select(Name,POS,GP,K)%>%
  mutate(
    KAVG = GP/K,
    GP80 = KAVG*80,
    GP100 = KAVG*100,
    GP120 = KAVG*120,
    GP130 = KAVG*130,
    GP140 = KAVG*140,
    GP150 = KAVG*150,
    GP160 = KAVG*160,
    GP164 = KAVG*164) 
    
write_csv(leaders, 'leaders.csv')  
