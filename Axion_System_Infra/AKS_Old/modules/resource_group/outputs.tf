output "resource_group_names" {

  description = "Map of Resource Group keys to names"

  value = {
    for name, rg in azurerm_resource_group.rg :
    name => rg.name
  }

}


output "resource_group_ids" {

  description = "Map of Resource Group keys to IDs"

  value = {
    for name, rg in azurerm_resource_group.rg :
    name => rg.id
  }

}