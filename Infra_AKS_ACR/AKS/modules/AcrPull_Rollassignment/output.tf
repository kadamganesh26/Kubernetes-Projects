output "role_assignment_ids" {

  description = "ACR Pull role assignment IDs"

  value = {

    for name, assignment in azurerm_role_assignment.acr_pull :

    name => assignment.id

  }

}