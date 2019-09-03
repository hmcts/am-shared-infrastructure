locals {
  key_vault_name = "am-sandbox"
  sharedResourceGroup = "am-shared-infrastructure-sandbox"
  envInUse = "sandbox"
}

module "vault" {
  source 					= "git@github.com:hmcts/cnp-module-key-vault.git?ref=master"
  name 						= "${local.key_vault_name}"
  product 					= "${var.product}"
  env 						= "${var.env}"
  tenant_id 				= "${var.tenant_id}"
  object_id 				= "${var.jenkins_AAD_objectId}"
  resource_group_name 		= "${azurerm_resource_group.rg.name}"
  product_group_object_id 	= "${var.product_group_object_id}"
  common_tags             	= "${local.common_tags}"
}

data "azurerm_key_vault" "am-shared-vault" {
  name = "${local.key_vault_name}"
  resource_group_name = "${local.sharedResourceGroup}"
}

data "azurerm_key_vault" "s2s_key_vault" {
  name = "s2s-${local.envInUse}"
  resource_group_name = "rpe-service-auth-provider-${local.envInUse}"
}

data "azurerm_key_vault_secret" "s2s_microservice" {
  name = "s2s-microservice"
  key_vault_id = "${data.azurerm_key_vault.am-shared-vault.id}"
}

data "azurerm_key_vault_secret" "s2s_url" {
  name = "s2s-url"
  key_vault_id = "${data.azurerm_key_vault.am-shared-vault.id}"
}

data "azurerm_key_vault_secret" "s2s_secret" {
  name = "microservicekey-am-accessmgmt-api"
  key_vault_id = "${data.azurerm_key_vault.s2s_key_vault.id}"
}

output "vaultName" {
  value = "${local.key_vault_name}"
}