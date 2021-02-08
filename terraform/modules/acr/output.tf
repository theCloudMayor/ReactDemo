output "acr_url" {
    value = azurerm_container_registry.acr.login_server
}

output "acr_id" {
    value = azurerm_container_registry.acr.id
}
output "acr_username" {
    value = azurerm_container_registry.acr.admin_username
}
output "acr_pwd" {
    value = azurerm_container_registry.acr.admin_password
}
output "acr" {
    value = azurerm_container_registry.acr
}