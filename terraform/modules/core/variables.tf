variable "resource_group" {
    type = object ({
        name = string
        location = string
    })
    default = {
        name = "rg-mydemo"
        location = "west europe"
            }
}

variable "log_analytics_workspace" {
  type = object({
    name           = string
    sku            = string
  })
  default = {
      name = "la-mydemo"
      sku = "PerGB2018"
  }
}
