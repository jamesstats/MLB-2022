library(tidyverse)
library(rvest)
library(janitor)

links <-"https://www.espn.com/mlb/stats/player/_/table/batting/sort/strikeouts/dir/desc"
strikes_html <-read_html(links)
strikes_tables <-strikes_html%>%html_table(fill=TRUE)
strikes_1<-strikes_tables[[1]]
strikes_2<-strikes_tables[[2]]
mlbtbl<-data.frame(strikes_1,strikes_2)  

getOption('digits')
options('digits'= 4) 

leaders <-mlbtbl%>%
  select(Name,POS,GP,K)%>%
   mutate(
    KPGP = GP/K,
    GP82 = KPGP*82,
    GP100 = KPGP*100,
    GP120 = KPGP*120,
    GP130 = KPGP*130,
    GP140 = KPGP*140,
    GP150 = KPGP*150,
    GP160 = KPGP*160,
    GP162 = KPGP*162) 
    
write_csv(leaders, 'leaders.csv')  
