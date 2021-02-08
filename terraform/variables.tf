variable "agent_count" {
    default = 1
    
}

//variable "ssh_public_key" {
//}

variable "resource_group" {
    type = object ({
        name = string
        location = string
    })
    default = {
        name = "rg-k8s-spring-react"
        location = "west europe"
            }
}
/*
variable "log_analytics_workspace" {
  type = object({
    name           = string
    sku            = string
  })
  default = {
      name = "la-k8s-react"
      sku = "PerGB2018"
  }
}

variable "dns_prefix" {
    default = "k8sspringreact"
}

variable cluster_name {
    default = "k8sspringreact"
}

variable "acr_name" {
  default = "acrahmedk8s"
}
*/