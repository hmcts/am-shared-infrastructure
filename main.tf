locals {
  tags = merge(var.common_tags,
    tomap({ team_contact = var.team_contact })
  )
}

// Shared Resource Group
resource "azurerm_resource_group" "rg" {
  name     = join("-", [var.product, "shared-infrastructure", var.env])
  location = var.location

  tags = local.tags
}