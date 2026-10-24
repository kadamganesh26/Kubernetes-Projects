# =========================================================
# Resource Groups
# =========================================================

output "resource_group_names" {

  description = "Created Resource Group names"

  value = module.resource_groups.resource_group_names

}


# =========================================================
# ACR
# =========================================================

output "acr_ids" {

  description = "Azure Container Registry resource IDs"

  value = module.acr.acr_ids

}


output "acr_login_servers" {

  description = "Azure Container Registry login servers"

  value = module.acr.acr_login_servers

}


# =========================================================
# AKS
# =========================================================

output "aks_ids" {

  description = "AKS resource IDs"

  value = module.aks.aks_ids

}


output "kubelet_identity_object_ids" {

  description = "AKS kubelet managed identity object IDs"

  value = module.aks.kubelet_identity_object_ids

}


# =========================================================
# ACR Pull Role Assignments
# =========================================================

output "acr_pull_role_assignment_ids" {

  description = "ACR Pull role assignment IDs"

  value = module.acr_pull_assignments.role_assignment_ids

}