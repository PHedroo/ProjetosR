install.packages("dplyr")
install.packages("tidyverse") #engloba o pacote lubridate (maniulação de datas)
# install.packages()

library(dplyr)
library(tidyverse)

df <- read.csv('data-raw/xco2.csv')
df

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
