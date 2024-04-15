provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_test" {
  name     = "rg-aks-test"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "test" {
  name                = "aks-test"
  location            = azurerm_resource_group.aks_test.location
  resource_group_name = azurerm_resource_group.aks_test.name
  node_resource_group = "rg-aks-test-nodes"
  dns_prefix          = "aks-test"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "aks_test_name" {
  value = azurerm_kubernetes_cluster.test.name
}