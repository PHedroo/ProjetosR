# REFERENCIA: https://beatrizmilz.github.io/RLadies-Git-RStudio-2019/#1

install.packages("usethis")
library(usethis)

usethis::use_git_config(user.name = "phedroo", # Seu nome
                        user.email = "pedro.marucio@gmail.com") # Seu email

usethis::create_github_token() #funcao nova (referindo-se ao artigo de 2019)
usethis::edit_r_environ()


