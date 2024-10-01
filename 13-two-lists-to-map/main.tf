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
  X = {for k in var.repos: k => [for i in var.ENV: {"repo_name" = k, "env" = i}]}
  l1 = tomap({"l1" = local.X})
}

output "map" {
   value = [ for a,b in local.l1["l1"]: a ]
}

