output "WebApp_Name" {
  value = azurerm_windows_web_app.WebApp.name
}

output "Webapp_default_hostname" {
  value = azurerm_windows_web_app.WebApp.default_hostname
}