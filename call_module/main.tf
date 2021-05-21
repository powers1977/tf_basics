provider "azurerm" {
  features {}
}

module "new_group" {
	source = "../modules/create_rg"
	group-name = "ryans_big_butt_group"
	group-location = "eastus"
}

output "return_output" {
	value = module.new_group.group_info
}
