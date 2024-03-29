# install.packages("dplyr")
# install.packages("tidyverse") #engloba o pacote lubridate (maniulação de datas)
# install.packages()
# install.packages("RColorBrewer")

library(RColorBrewer)
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
  summarise(xco2_m = mean(xco2)) %>%
  mutate(
    # date_new=as_date(str_c(ano,mes,'15',sep='-')),
    data = make_date(ano,mes,'15')
    ) %>% #CRIAR GRAFICO
  #Em x será a data e y Xco2
  ggplot(aes(x=data, y=xco2_m)) +
  geom_point(col="darkred") +
  geom_line(col="darkred") +
  theme_bw()










