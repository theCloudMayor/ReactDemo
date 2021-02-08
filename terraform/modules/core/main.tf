resource "azurerm_resource_group" "k8s_springreact" {
    name     = var.resource_group.name
    location = var.resource_group.location
}

resource "azurerm_log_analytics_workspace" "loganalytics" {
    name                = var.log_analytics_workspace.name
    location            = azurerm_resource_group.k8s_springreact.location
    resource_group_name = azurerm_resource_group.k8s_springreact.name
    sku                 = var.log_analytics_workspace.sku
}

resource "azurerm_log_analytics_solution" "loganalytics_solution" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.loganalytics.location
    resource_group_name   = azurerm_resource_group.k8s_springreact.name
    workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
    workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}

