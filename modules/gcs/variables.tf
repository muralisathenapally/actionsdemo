variable "name" {}
variable "project" {}
variable "location" {}
variable "force_destroy" {
  type    = bool
  default = false
}
variable "public_access_prevention" {
  type    = string
  default = "enforced"
}
