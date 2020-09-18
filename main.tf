locals {
  common_tags = {
    environment  = var.env
    team_name    = var.team_name
    team_contact = var.team_contact
  }
}

// Shared Resource Group
resource "azurerm_resource_group" "rg" {
  name      = join("-", [var.product, "shared-infrastructure", var.env])
  location  = var.location

  tags      = {
    "Deployment Environment"  = var.env
    "Team Name"               = var.team_name
    "Team Contact"            = var.team_contact
    "Destroy Me"              = var.destroy_me
  }
}