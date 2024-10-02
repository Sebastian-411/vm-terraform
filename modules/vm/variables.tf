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
  type        = string
}

# Resource Group
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

# Public IP
variable "public_ip_name" {
  description = "The name of the public IP."
  default     = "sebastian-public-ip"
}

# Network Interface
variable "nic_name" {
  description = "The name of the network interface."
  default     = "sebastian-nic"
}

# Network Security Group
variable "nsg_name" {
  description = "The name of the network security group."
  default     = "sebastian-nsg"
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

# Subnet
variable "subnet_id" {
  description = "The ID of the subnet to associate with the network interface."
  type        = string
}
