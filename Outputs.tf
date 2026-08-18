output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "web_subnet_name" {
  value = module.network.web_subnet_name
}

output "public_ip_name" {
  value = module.network.public_ip_name
}

output "nsg_name" {
  value = module.security.nsg_name
}

output "vm_name" {
  value = module.vm.vm_name
}

output "vm_id" {
  value = module.vm.vm_id
}

output "nic_id" {
  value = module.vm.nic_id
}

output "nic_private_ip" {
  value = module.vm.nic_private_ip
}

output "private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

output "bastion_name" {
  value = module.bastion.bastion_name
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}