locals {
  common_tags = {
    environment  = var.env
    team_name    = var.team_name
    team_contact = var.team_contact
    application = var.application
    businessArea = var.business_area
    builtFrom = var.built_from
    expiresAfter = var.expires_after
  }
}

// Shared Resource Group
resource "azurerm_resource_group" "rg" {
  name     = join("-", [var.product, "shared-infrastructure", var.env])
  location = var.location

  tags = {
    "Deployment Environment" = var.env
    "Team Name"              = var.team_name
    "Team Contact"           = var.team_contact
    "Destroy Me"             = var.destroy_me
  }
}