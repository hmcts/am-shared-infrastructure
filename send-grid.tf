locals {
  sendgrid_subscription = {
    prod    = "8999dec3-0104-4a27-94ee-6588559729d1"
    nonprod = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
  }
}

data "azurerm_key_vault" "sendgrid_key_vault" {
  provider = azurerm.sendgrid

  name                = var.env != "prod" ? "sendgridnonprod" : "sendgridprod"
  resource_group_name = var.env != "prod" ? "SendGrid-nonprod" : "SendGrid-prod"
}

data "azurerm_key_vault_secret" "sendgrid_api_key" {
  provider = azurerm.sendgrid

  name         = "hmcts-access-management-api-key"
  key_vault_id = data.azurerm_key_vault.sendgrid_key_vault.id
}

data "azurerm_key_vault_secret" "sendgrid_password" {
  provider = azurerm.sendgrid

  name         = "hmcts-access-management-password"
  key_vault_id = data.azurerm_key_vault.sendgrid_key_vault.id
}

resource "azurerm_key_vault_secret" "am_sendgrid_api_key" {
  name         = "am-sendgrid-api-key"
  value        = data.azurerm_key_vault_secret.sendgrid_api_key.value
  key_vault_id = module.vault.key_vault_id
}

resource "azurerm_key_vault_secret" "am_sendgrid_password" {
  name         = "am-sendgrid-password"
  value        = data.azurerm_key_vault_secret.sendgrid_password.value
  key_vault_id = module.vault.key_vault_id
}