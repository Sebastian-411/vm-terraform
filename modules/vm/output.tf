# Output for the Virtual Machine ID
output "vm_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm_sebastian_first.id
}

# Output for the public IP
output "public_ip" {
  description = "The public IP of the virtual machine."
  value       = azurerm_public_ip.public_ip_first_vm.ip_address
}