provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "aks_prod" {
  name     = "cst8918-final-project-group-02"
  location = "Canada Central"
}

# Azure Container Registry
resource "azurerm_container_registry" "acr" {
  name                = "azurecontainerregistryfinal"
  resource_group_name = "cst8918-final-project-group-2"
  location            = "canadacentral"
  sku                 = "Basic"
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
    min_count  = 1
    max_count  = 3
    vm_size    = "Standard_B2s"
    vnet_subnet_id = "10.0.0.0/16"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "aks_prod_name" {
  value = azurerm_kubernetes_cluster.prod.name
}