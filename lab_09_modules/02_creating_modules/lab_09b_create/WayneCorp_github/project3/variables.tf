## Environment and Project
variable "environment" {
  type        = string
  description = "e.g. test dev prod"
  default     = "dev"
}

variable "company" {
  type    = string
  default = "WayneCorp"
}
variable "project" {
  type = string
}

variable "lab_number" {
  type = string
}

variable "versioning" {
  type    = bool
  default = false
}

variable "profile" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-west-1"
}