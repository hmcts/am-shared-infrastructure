module "vault" {
  source = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name = "${var.product}-${var.env}"
  product = "${var.product}"
  env = "${var.env}"
  tenant_id = "${var.tenant_id}"
  object_id = "${var.jenkins_AAD_objectId}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  product_group_object_id = "${var.product_group_object_id}"
  managed_identity_object_id = "${var.managed_identity_object_id}"
  common_tags = "${local.common_tags}"
}

resource "azurerm_key_vault_secret" "appInsightsInstrumentationKey" {
  name = "AppInsightsInstrumentationKey"
  value = "${azurerm_application_insights.appinsights.instrumentation_key}"
  key_vault_id = "${module.vault.key_vault_id}"
}