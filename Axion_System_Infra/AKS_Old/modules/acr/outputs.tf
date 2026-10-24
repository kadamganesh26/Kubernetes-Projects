output "acr_ids" {

  description = "Map of ACR names to resource IDs"

  value = {

    for name, acr in azurerm_container_registry.acr :

    name => acr.id

  }

}


output "acr_names" {

  description = "Map of ACR names"

  value = {

    for name, acr in azurerm_container_registry.acr :

    name => acr.name

  }

}


output "acr_login_servers" {

  description = "Map of ACR names to login servers"

  value = {

    for name, acr in azurerm_container_registry.acr :

    name => acr.login_server

  }

}