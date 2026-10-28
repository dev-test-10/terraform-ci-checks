terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.35.0, < 6.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}

module "log_analytics" {
  source  = "equinor/log-analytics/azurerm"
  version = "~> 2.5"

  workspace_name      = "log-ops-weu"
  resource_group_name = "rg-ops-weu"
  location            = "westeurope"

  daily_quota_gb    = 10
  retention_in_days = 90
}
