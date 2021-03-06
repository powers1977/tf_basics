provider "azurerm" {
  #version = "=1.37.0"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "demo" {
  name     = "demo"
  location = var.location
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "tfstorageryan"
    container_name       = "terraform-state-container"
    key                  = "terraform.tfstate"
  }
}
