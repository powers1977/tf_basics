terraform {
	required_version = ">= 0.15"
}

resource "azurerm_resource_group" "group" {
  name     = var.group-name
  location = var.group-location
}

output "group_info" {
	value = azurerm_resource_group.group

}
