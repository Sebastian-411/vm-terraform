# Output for the Virtual Network name
output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet_sebastian.name
}

# Output for the Subnet name
output "subnet_name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.subnet_vnet_sebastian.name
}

# Output for the Virtual Machine ID
output "vm_id" {
  description = "The ID of the virtual machine."
  value       = module.vm.vm_id
}

# Output for the public IP
output "public_ip" {
  description = "The public IP of the virtual machine."
  value       = module.vm.public_ip
}