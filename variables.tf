# Subscription ID
variable "subscription_id" {
  description = "Azure subscription ID"
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