provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_prod" {
  name     = "rg-aks-prod"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "prod" {
  name                = "aks-prod"
  location            = azurerm_resource_group.aks_prod.location
  resource_group_name = azurerm_resource_group.aks_prod.name
  node_resource_group = "rg-aks-prod-nodes"
  dns_prefix          = "aks-prod"

  default_node_pool {
    name       = "default"
    node_count = 1
    min_count  = null
    max_count  = null
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "aks_prod_name" {
  value = azurerm_kubernetes_cluster.prod.name
}