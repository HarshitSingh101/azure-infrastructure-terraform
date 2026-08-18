output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "web_subnet_id" {
  value = module.network.web_subnet_id
}

output "bastion_subnet_id" {
  value = module.network.bastion_subnet_id
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

output "bastion_name" {
  value = module.bastion.bastion_name
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}