provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias = "legacy"
  version = "=1.44.0"
}

terraform {
  required_version = ">= 0.13"  # Terraform client version

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.25"       # AzureRM provider version
    }
  }
}