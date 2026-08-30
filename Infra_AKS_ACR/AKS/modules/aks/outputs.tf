output "aks_ids" {

  description = "Map of AKS cluster names to resource IDs"

  value = {

    for name, cluster in azurerm_kubernetes_cluster.aks :

    name => cluster.id

  }

}


output "aks_names" {

  description = "Map of AKS cluster names"

  value = {

    for name, cluster in azurerm_kubernetes_cluster.aks :

    name => cluster.name

  }

}


output "kubelet_identity_object_ids" {

  description = "Map of AKS cluster names to kubelet identity object IDs"

  value = {

    for name, cluster in azurerm_kubernetes_cluster.aks :

    name => cluster.kubelet_identity[0].object_id

  }

}