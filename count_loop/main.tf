provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "group" {
  count    = 4
  name     = "ryans-test-group-${count.index}"
  location = var.rg-location
}

output "resource-groups" {

	#__Display name of one group
	#value = azurerm_resource_group.group[0].name

	#__Display name of all groups with splat
	#value = azurerm_resource_group.group[*].name

	#__Display name of all groups with for loop
	#value = [for gname in azurerm_resource_group.group : gname]
	value = [for gname in azurerm_resource_group.group : gname.name]
}

output "test" {
  value = {
    for info, details in azurerm_resource_group.group:
    info => ({"name" = details.name , "location" = details.location})
  }
}
