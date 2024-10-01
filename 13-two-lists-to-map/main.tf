variable "repos" {
  default = [
    "roboshop-cart",
    "roboshop-catalogue",
    "roboshop-user",
    "roboshop-shipping",
    "roboshop-payment",
    "roboshop-frontend"
  ]
}

variable "ENV" {
  default = [
    "DEV",
    "QA",
    "UAT",
    "PROD"
  ]
}

locals {
  repo_env_map = {
    for repo in var.repos :
      for env in var.ENV :
        "${repo}_${env}" => {
            repo_name = repo
            env       = env
        }
      }
}


output "map" {
   #value = { for k in var.repos: for i in var.ENV: "${k}_${i}" => {"repo_name" = k, "env" = i}}
        value = local.repo_env_map
}

