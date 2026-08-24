terraform {
  required_version = ">=1.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "ASP" {
  name                = var.App_Service_Plan_Name
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_windows_web_app" "WebApp" {
  name                = var.Web_App_Name
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  service_plan_id     = azurerm_service_plan.ASP.id
  site_config {
    application_stack {
      dotnet_version = "v10.0"
      current_stack  = "dotnet"
    }
  }
}