install.packages("tidyverse")
install.packages("usethis")
install.packages("geobr")
install.packages("trend")

usethis::use_git_config(user.name = "seu_username_github", # Seu nome
                        user.email = "seu_email_github") # Seu email
usethis::create_github_token()
usethis::edit_r_environ()
