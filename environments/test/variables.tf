variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

# Network
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
  type = string
}

# Security
variable "nsg_name" {
  type = string
}

# VM
variable "nic_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

# Bastion
variable "bastion_public_ip_name" {
  type = string
}

variable "bastion_name" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "workspace_name" {
  type = string
}

variable "dcr_name" {
  type = string
}

variable "action_group_name" {
  type = string
}

variable "alert_name" {
  type = string
}

variable "alert_email" {
  type = string
}