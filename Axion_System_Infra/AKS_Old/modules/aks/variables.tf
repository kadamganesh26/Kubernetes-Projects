variable "kubernetes_clusters" {

  description = "Azure Kubernetes Service clusters"

  type = map(object({

    resource_group_name = string

    location = string

    dns_prefix = string


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


    identity = object({

      type = string

    })


    network_profile = optional(

      object({

        network_plugin = optional(
          string,
          "azure"
        )

        load_balancer_sku = optional(
          string,
          "standard"
        )

      }),

      null

    )


    ingress_application_gateway = optional(

      object({

        gateway_id = optional(string)

        gateway_name = optional(string)

        subnet_cidr = optional(string)

        subnet_id = optional(string)

      }),

      null

    )


    tags = optional(
      map(string),
      {}
    )

  }))

}