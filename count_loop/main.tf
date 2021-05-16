provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "group" {
  count    = 4
  name     = "ryans-test-group-${count.index}"
  location = var.rg-location
}


