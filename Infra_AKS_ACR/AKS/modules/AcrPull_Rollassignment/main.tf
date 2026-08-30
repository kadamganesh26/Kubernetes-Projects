resource "azurerm_role_assignment" "acr_pull" {

  for_each = var.acr_pull_assignments


  scope = each.value.acr_id


  role_definition_name = "AcrPull"


  principal_id = each.value.principal_id

}