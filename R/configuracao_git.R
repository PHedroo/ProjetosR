install.packages("tidyverse")
install.packages("usethis")
install.packages("geobr")
install.packages("trend")

usethis::use_git_config(user.name = "PHedroo", # Seu nome
                        user.email = "pedro.marucio@gmail.com") # Seu email
usethis::create_github_token()
usethis::edit_r_environ()
