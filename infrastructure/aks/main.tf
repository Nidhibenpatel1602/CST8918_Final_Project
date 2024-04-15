provider "azurerm" {
  features {}
}

module "aks_test" {
  source = "./test"
}


output "aks_test_name" {
  value = module.aks_test.aks_test_name
}

module "aks_prod" {
  source = "./prod"
}

output "aks_prod_name" {
  value = module.aks_prod.aks_prod_name
}
 