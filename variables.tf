# Subscription ID
variable "subscription_id" {
  description = "Azure subscription ID"
}

# Admin Credentials
variable "admin_username" {
  description = "Admin username for the virtual machine."
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machine."
  default     = "P@ssw0rd1234!"
}

# Location
variable "location" {
  description = "The Azure region to deploy resources in."
  default     = "westus"
}

# Resource Group
variable "resource_group_name" {
  description = "The name of the resource group."
  default     = "sebastian-resource-group"
}

# Virtual Network
variable "vnet_name" {
  description = "The name of the virtual network."
  default     = "sebastian-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network."
  default     = "10.0.0.0/16"
}

# Subnet
variable "subnet_name" {
  description = "The name of the subnet."
  default     = "sebastian-subnet"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet."
  default     = "10.0.1.0/24"
}

# Public IP
variable "public_ip_name" {
  description = "The name of the public IP."
  default     = "sebastian-public-ip"
}

# Network Security Group
variable "nsg_name" {
  description = "The name of the network security group."
  default     = "sebastian-nsg"
}

# Network Interface
variable "nic_name" {
  description = "The name of the network interface."
  default     = "sebastian-nic"
}

# Virtual Machine
variable "vm_name" {
  description = "The name of the virtual machine."
  default     = "sebastian-vm"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  default     = "Standard_DS1_v2"
}
