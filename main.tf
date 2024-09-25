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

# Public IP
resource "azurerm_public_ip" "public_ip_first_vm" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg_sebastian.location
  resource_group_name = azurerm_resource_group.rg_sebastian.name
  allocation_method   = "Static"
}

# Network Security Group (NSG)
resource "azurerm_network_security_group" "nsg_sebastian_first" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg_sebastian.location
  resource_group_name = azurerm_resource_group.rg_sebastian.name
}

# Inbound rule (SSH)
resource "azurerm_network_security_rule" "inbound_rule_first_vm" {
  name                        = "allow_ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_sebastian.name
  network_security_group_name = azurerm_network_security_group.nsg_sebastian_first.name
}

# Outbound rule (Internet)
resource "azurerm_network_security_rule" "outbound_rule_first_vm" {
  name                        = "allow_internet"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "0.0.0.0/0"
  resource_group_name         = azurerm_resource_group.rg_sebastian.name
  network_security_group_name = azurerm_network_security_group.nsg_sebastian_first.name
}

# Network Interface (NIC)
resource "azurerm_network_interface" "nic_sebastian_first" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg_sebastian.location
  resource_group_name = azurerm_resource_group.rg_sebastian.name

  ip_configuration {
    name                          = "my_ip_config"
    subnet_id                     = azurerm_subnet.subnet_vnet_sebastian.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_first_vm.id
  }
}

# Associate NSG with NIC
resource "azurerm_network_interface_security_group_association" "nic_nsg_association_sebastian_first" {
  network_interface_id      = azurerm_network_interface.nic_sebastian_first.id
  network_security_group_id = azurerm_network_security_group.nsg_sebastian_first.id
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm_sebastian_first" {
  name                = var.vm_name
  location            = azurerm_resource_group.rg_sebastian.location
  resource_group_name = azurerm_resource_group.rg_sebastian.name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.nic_sebastian_first.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  disable_password_authentication = false
  provision_vm_agent              = true
}
