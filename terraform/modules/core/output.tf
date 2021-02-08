output "resource_group" {
    value = azurerm_resource_group.k8s_springreact
}

output "loganalytics" {
    value = azurerm_log_analytics_workspace.loganalytics
}
