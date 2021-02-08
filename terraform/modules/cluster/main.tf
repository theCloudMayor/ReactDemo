resource "azurerm_kubernetes_cluster" "k8s_springreact" {
    name                = var.cluster_name
    location            = var.location
    resource_group_name = var.resource_group_name
    dns_prefix          = var.dns_prefix

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = "Standard_D2_v2"
        type            = "VirtualMachineScaleSets"
    }

    identity {
        type = "SystemAssigned"
    }

    network_profile {
    load_balancer_sku = "Standard"
    network_plugin = "kubenet"
    }
    
    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = var.loganalytics_id
        }
        
        kube_dashboard {
        enabled = true
        }
    }
}
