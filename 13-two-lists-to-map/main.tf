variable "repos" {
  default = [
    "roboshop-cart",
    "roboshop-catalogue"
  ]
}

variable "ENV" {
  default = [
    "DEV",
    "QA"
  ]
}

locals {
  X = {for k in var.repos: k => [for i in var.ENV: {"repo_name" = k, "env" = i}]}
  l1 = tomap({"l1" = local.X})
}

output "map" {
   value = [ for a,b in local.l1["l1"]: b ]
}

