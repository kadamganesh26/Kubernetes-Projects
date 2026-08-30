# =========================================================
# Resource Groups
# =========================================================

module "resource_groups" {

  source = "../../modules/resource_group"

  resource_groups = var.infra_config.resource_groups

}


# =========================================================
# Azure Container Registry
# =========================================================

module "acr" {

  source = "../../modules/acr"

  container_registries = {

    for k, v in var.infra_config.container_registries : k => {

      resource_group_name = module.resource_groups.resource_group_names[
        v.rg_key
      ]

      location = var.infra_config.resource_groups[
        v.rg_key
      ].location

      sku = v.sku

      admin_enabled = v.admin_enabled

      tags = v.tags

    }

  }

}


# =========================================================
# Azure Kubernetes Service
# =========================================================

module "aks" {

  source = "../../modules/aks"

  kubernetes_clusters = {

    for k, v in var.infra_config.kubernetes_clusters : k => {

      resource_group_name = module.resource_groups.resource_group_names[
        v.rg_key
      ]

      location = var.infra_config.resource_groups[
        v.rg_key
      ].location

      dns_prefix = v.dns_prefix

      default_node_pool = v.default_node_pool

      identity = v.identity

      network_profile = v.network_profile

      tags = v.tags

    }

  }

}


# =========================================================
# ACR Pull Role Assignment
# AKS Kubelet Identity -> ACR AcrPull
# =========================================================

module "acr_pull_assignments" {

  source = "../../modules/AcrPull_Rollassignment"

  acr_pull_assignments = {

    for cluster_name, cluster in var.infra_config.kubernetes_clusters :

    cluster_name => {

      acr_id = module.acr.acr_ids[
        cluster.acr_key
      ]

      principal_id = module.aks.kubelet_identity_object_ids[
        cluster_name
      ]

    }

    if try(cluster.acr_key, null) != null

  }

}