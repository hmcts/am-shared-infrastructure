locals {
  key_vault_name = "${var.product}-${var.env}"
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

output "vaultName" {
  value = "${local.key_vault_name}"
}