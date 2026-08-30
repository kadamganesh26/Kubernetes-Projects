variable "acr_pull_assignments" {

  description = "ACR Pull role assignments"

  type = map(object({

    acr_id = string

    principal_id = string

  }))

}