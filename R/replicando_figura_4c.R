#REPLICANDO A FIGURA 4c
#https://repositorio.unesp.br/server/api/core/bitstreams/c620456a-58a9-473a-a15b-7cc943f7f5d9/content

# install.packages("tidyverse")
# install.packages("readr")

library(tidyverse)
library(usethis)
library(readr)

#LENDO O BANCO DE DADOS
df <- read.csv('data-raw/sif.csv')
#VISUALIZANDO O DATA FRAME
df



df %>%
  mutate(
    data = as_datetime(time, origin = '1990-01-01 00:00:00' , tz = "UTC"),
    ano = year(data),
    mes = month(data)) %>%
  # pull(ano) %>%
  # max()
  filter(ano <2022) %>%
  group_by(ano, mes) %>%
  summarise(sif_757 = mean(sif_757)) %>%
  mutate (
    new_date = make_date(ano, mes , '01')
  ) %>%
  ggplot(aes(x = new_date, y = sif_757)) +
  geom_point(col = 'darkgreen') +
  geom_line(col ='darkgreen') +
  theme_bw()



#EXPLICANDO PASSO A PASSO DAS FUNCOES E APLICACOES

#"date" ja esta no formato americano (Y, m, d) reconhecido pelo R, porém
#"date" foi equivocadamente criado, devo, a partir do "time" (do df), descobrir
# a data; "time" parte do dia 01/01/1990 até 2022 (fornecido na fonte de
#aquisicao do banco de dados), porém esta em segundos

df %>%
  mutate( #criando coluna data, argumentos <- (coluna do df, origin = 'data e hora de inicio', tz/nome do fuso horario = 'UTC')
    data = as_datetime(time, origin = '1990-01-01 00:00:00' , tz = "UTC"),
    ano = year(data),
    mes = month(data)) %>%
  # pull(ano) %>% #a funcao pull seleciona uma coluna no data frame e a transforma em um vetor..
  # max() #retorna o maximo valor de um vetor de um data frame, existe tambem a min(), que retorna o minimo...
  filter(ano <2022) %>% #fltrando colua ano para datas até 2021
  group_by(ano, mes) %>% #agrupando as colunas ano e mes do data frame. Geralmente é seguida por summarise
  summarise(sif_757 = mean(sif_757)) %>% #Cria um novo dataframe. Retorna uma linha para cada combinação de variáveis ​​de agrupamento; se não houver variáveis ​​de agrupamento, a saída terá uma única linha resumindo todas as observações na entrada. Ele conterá uma coluna para cada variável de agrupamento e uma coluna para cada uma das estatísticas resumidas que você especificou. Podemos calcular a soma, contagem, mínimo ou máximo substituindo a media(mean) na função resumida ou agregada, a depender do proposito e condicoes da analise
  mutate (
    new_date = make_date(ano, mes , '01') #criando nova data com base no retorno do dateframe gerado pelo summarise
  ) %>%
  # criando grafico pelo ggplot,
  ggplot(aes(x = new_date, y = sif_757)) + #eixo x  = objeto_new_date, y = coluna_do_data_frame_do_summarise
  geom_point(col = 'darkgreen') + #argumento de geom_point(col = 'cor') <- col = color
  geom_line(col ='darkgreen') + #argumento de geom_line(col = 'cor') <- col = color
  theme_minimal() #uso esse ou o theme_bw(). Existem diversos outros temas: https://ggplot2-book.org/themes#:~:text=0%3A,reminiscent%20of%20a%20line%20drawing.

