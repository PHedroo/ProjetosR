# REFERENCIA: https://beatrizmilz.github.io/RLadies-Git-RStudio-2019/#1

# install.packages("tidyverse")
install.packages("usethis")
# install.packages("geobr")
# install.packages("trend")

usethis::use_git_config(user.name = "phedroo", # Seu nome
                        user.email = "pedro.marucio@gmail.com") # Seu email

usethis::create_github_token() #funcao nova (referindo-se ao artigo de 2019)
usethis::edit_r_environ()


