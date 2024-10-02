provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg_sebastian" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet_sebastian" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.rg_sebastian.location
  resource_group_name = azurerm_resource_group.rg_sebastian.name
}

# Subnet
resource "azurerm_subnet" "subnet_vnet_sebastian" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg_sebastian.name
  virtual_network_name = azurerm_virtual_network.vnet_sebastian.name
  address_prefixes     = [var.subnet_address_prefix]
}

module "vm" {
  source = "./modules/vm"

  location            = azurerm_resource_group.rg_sebastian.location
  resource_group_name = azurerm_resource_group.rg_sebastian.name
  subnet_id           = azurerm_subnet.subnet_vnet_sebastian.id
}
