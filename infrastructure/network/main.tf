provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "network" {
  name     = "cst8918-final-project-group-02"
  location = "Canada Central"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-cst8918-final-project-group-02"
  address_space       = ["10.0.0.0/14"]
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
}

resource "azurerm_subnet" "prod" {
  name                 = "snet-prod"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "test" {
  name                 = "snet-test"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "dev" {
  name                 = "snet-dev"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "admin" {
  name                 = "snet-admin"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.3.0.0/16"]
}

output "resource_group_name" {
  value = azurerm_resource_group.network.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_prod" {
  value = azurerm_subnet.prod.name
}

output "subnet_test" {
  value = azurerm_subnet.test.name
}

output "subnet_dev" {
  value = azurerm_subnet.dev.name
}

output "subnet_admin" {
  value = azurerm_subnet.admin.name
}