install.packages("dplyr")
install.packages("geobr")
install.packages("trend")
install.packages("tidyverse") #engloba o pacote lubridate (maniulação de datas)
# install.packages()

library(dplyr)
library(tidyverse)
library(geobr)
library(trend)

#LENDO O BANCO DE DADOS IMPORTADO PARA A PASTA data-raw
  #BANCO DE DADOS ESTE EM FORMATO .csv, nomeado "xco2"
df <- read.csv('data-raw/xco2.csv')
df

# View(df) or click in df on environment

# USANDO PIPE
df %>%
  #filter(year(date)>2014) %>% continua com o problema de datas em formato diario
  mutate(
    ano = year(date),
    mes = month(date)
  ) %>%
  filter(ano>2014,ano<2022) %>%
  group_by(ano, mes) %>%
  # mutate(xco2_m = mean(xco2))
  summarise(xco2_m = mean(xco2))
