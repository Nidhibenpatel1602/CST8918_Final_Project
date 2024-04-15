provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "backend" {
  name     = "rg-terraform-backend"
  location = "Canada Central"
}

resource "azurerm_storage_account" "backend" {
  name                     = "prstoragefi"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend" {
  name                  = "terraform-state"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}

output "backend_resource_group_name" {
  value = azurerm_resource_group.backend.name
}

output "backend_storage_account_name" {
  value = azurerm_storage_account.backend.name
}

output "backend_container_name" {
  value = azurerm_storage_container.backend.name
}