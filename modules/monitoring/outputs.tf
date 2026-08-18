output "workspace_id" {
  value = azurerm_log_analytics_workspace.workspace.id
}

output "workspace_name" {
  value = azurerm_log_analytics_workspace.workspace.name
}

output "workspace_resource_id" {
  value = azurerm_log_analytics_workspace.workspace.workspace_id
}