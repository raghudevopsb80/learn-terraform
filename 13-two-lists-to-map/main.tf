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

output "map" {
   value = { for k in var.repos: for i in var.ENV: "${k}_${i}" => {"repo_name" = k, "env" = i}}
}

