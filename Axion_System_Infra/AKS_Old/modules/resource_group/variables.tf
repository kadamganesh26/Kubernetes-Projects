variable "resource_groups" {

  description = "Resource Groups to create"

  type = map(object({

    location = string

    tags = optional(
      map(string),
      {}
    )

  }))

}