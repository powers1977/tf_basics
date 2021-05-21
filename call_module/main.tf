provider "azurerm" {
  features {}
}

module "new_group" {
	source = "../modules/create_rg"
	group-name = "ryans_sweet_group"
	group-location = "eastus"
}
