provider "azurerm" {
  features {}
  use_oidc = true
}

terraform {
  required_version = "~> 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

module "backend" {
  source = "./infrastructure/backend"
}

module "network" {
  source = "./infrastructure/network"
}

module "aks" {
  source = "./infrastructure/aks"
}

module "redis" {
  source = "./infrastructure/redis"
}