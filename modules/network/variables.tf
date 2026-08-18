variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "web_subnet_name" {
  type = string
}

variable "web_subnet_prefix" {
  type = list(string)
}

variable "bastion_subnet_prefix" {
  type = list(string)
}

variable "public_ip_name" {
  type    = string
  default = null
}