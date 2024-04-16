provider "azurerm" {
  features {}
  use_oidc = true
}

# Create the Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "cst8918-final-project-group-02"
  location = "Canada Central"
}

# Create the Redis Cache for the test environment
resource "azurerm_redis_cache" "test" {
  name                = "weather-app-test-redis"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  subnet_id           = ["10.1.0.0/16"]

  tags = {
    environment = "test"
  }
}

# Create the Redis Cache for the production environment
resource "azurerm_redis_cache" "prod" {
  name                = "weather-app-prod-redis"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  subnet_id           = ["10.0.0.0/16"]

  tags = {
    environment = "prod"
  }
}