infra_config = {

  # ---------------------------------------------------------
  # Resource Groups
  # ---------------------------------------------------------

  resource_groups = {

    "rg-micro-prod" = {

      location = "australiasoutheast"

      tags = {
        Environment = "Dev"
        ManagedBy   = "Terraform"
        Project     = "Microservices"
      }

    }

  }


  # ---------------------------------------------------------
  # Azure Container Registry
  # ---------------------------------------------------------

  container_registries = {

    "acrmicrodev2606" = {

      rg_key = "rg-micro-prod"

      sku = "Basic"

      admin_enabled = false

      tags = {
        Environment = "Dev"
        ManagedBy   = "Terraform"
        Project     = "Microservices"
      }

    }

  }


  # ---------------------------------------------------------
  # AKS
  # ---------------------------------------------------------

  kubernetes_clusters = {

    "aks-micro-dev" = {

      rg_key = "rg-micro-prod"

      dns_prefix = "aksmicrodev"

      # ACR associated with this AKS
      acr_key = "acrmicrodev2606"


      default_node_pool = {

        name = "default"

        node_count = 2

        vm_size = "standard_b2ls_v2"

        type = "VirtualMachineScaleSets"

      }


      # AKS Managed Identity
      identity = {

        type = "SystemAssigned"

      }


      # AKS networking
      network_profile = {

        network_plugin = "azure"

        load_balancer_sku = "standard"

      }


      tags = {

        Environment = "Dev"

        ManagedBy = "Terraform"

        Project = "Microservices"

      }

    }

  }

}