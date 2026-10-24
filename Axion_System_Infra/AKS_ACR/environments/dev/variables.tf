variable "infra_config" {

  description = "Complete infrastructure configuration for Dev environment"

  type = object({

    resource_groups = map(object({

      location = string

      tags = optional(
        map(string),
        {}
      )

    }))

    container_registries = map(object({

      rg_key = string

      sku = optional(
        string,
        "Standard"
      )

      admin_enabled = optional(
        bool,
        false
      )

      tags = optional(
        map(string),
        {}
      )

    }))

    kubernetes_clusters = map(object({

      rg_key = string

      dns_prefix = string

      acr_key = optional(string)

      default_node_pool = object({

        name = string

        node_count = optional(
          number,
          1
        )

        vm_size = optional(
          string,
          "Standard_DS2_v2"
        )

        type = optional(
          string,
          "VirtualMachineScaleSets"
        )

      })

      identity = optional(
        object({
          type = string
        }),
        {
          type = "SystemAssigned"
        }
      )

      network_profile = optional(
        object({
          network_plugin    = optional(string, "azure")
          load_balancer_sku = optional(string, "standard")
        }),
        null
      )

      tags = optional(
        map(string),
        {}
      )

    }))

  })

}