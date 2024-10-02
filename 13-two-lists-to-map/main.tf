# variable "repos" {
#   default = [
#     "roboshop-cart",
#     "roboshop-catalogue"
#   ]
# }
#
# variable "ENV" {
#   default = [
#     "DEV",
#     "QA"
#   ]
# }
#
# locals {
#   X = {for k in var.repos: k => [for i in var.ENV: {"repo_name" = k, "env" = i}]}
#   l1 = tomap({"l1" = local.X})
# }
#
# output "map" {
#    value = [ for a,b in local.l1["l1"]: b ]
# }
#

variable "repos" {
  default = {
    "roboshop-cart" = {}
    "roboshop-catalogue" = {}
  }
}

variable "env" {
  default = {
    "DEV" = {}
    "QA" = {}
    "UAT" = {}
    "PROD" = {}
  }
}

locals {
  repos_with_envs = {for i,j in var.repos : i => { for x,y in var.env : "${i}_${x}" => {"env" = x, "app" = i} }}
}

output "x" {
  value = concat(concat([for a,b in local.repos_with_envs: values(b)]))
}
