provider "azurerm" {
    version = "~>2.0"
    features {}
}

terraform {
  backend "azurerm" {
  }
}

module "core" {
    source = "./modules/core/"
}

module "acr" {
    source = "./modules/acr/"
    acr_name = "ahmedk8sacr"
    resource_group_name = module.core.resource_group.name
    location = module.core.resource_group.location
}

module "cluster" {
    source = "./modules/cluster"
    dns_prefix = "mydemok8s"
    cluster_name = "mydemok8s"
    location = module.core.resource_group.location
    resource_group_name = module.core.resource_group.name
    loganalytics_id = module.core.loganalytics.id
    agent_count = 1
}


resource "azurerm_role_assignment" "role_acrpull" {
  scope                            = module.acr.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = module.cluster.k8scluster.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}
/*

resource "azurerm_kubernetes_cluster" "k8s_springreact" {
    name                = var.cluster_name
    location            = azurerm_resource_group.k8s_springreact.location
    resource_group_name = azurerm_resource_group.k8s_springreact.name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = "Standard_D2_v2"
        type            = "VirtualMachineScaleSet"
    }

    identity {
        type = "SystemAssigned"
    }
   
    linux_profile {
    admin_username = "azureadmin"
    ssh_key {
        key_data = var.ssh_key
    }
    }

    network_profile {
    load_balancer_sku = "Standard"
    network_plugin = "kubenet"
    }
    
    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.loganalytics.id
        }
        
        kube_dashboard {
        enabled = true
        }
    }
}

*/