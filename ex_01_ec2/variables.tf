variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "profile" {
  type    = string
  default = "cta"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "company" {
    type = string
    default = "raquelCompany"
}

variable "project" {
    type = string
    default = "projectEC2"
}

variable "instance_type" {
  type    = string
}

variable "sec_allowed_external" {
description = "CIDRs from which access is allowed"
  type        = list(string)
  default     = ["0.0.0.0/0"]
  # default = ["2.37.1.5/32", "8.2.0.0/16"]
}

variable "special_port" {
  
}