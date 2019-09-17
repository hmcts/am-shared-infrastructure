//SHARED VARIABLES
variable "product" {
  type        = "string"
  default     = "am"
  description = "Access Management"
}

variable "component" {
  type        = "string"
  default     = "shared"
  description = "Access Management"
}

variable "env" {
  type = "string"
  description = "The deployment environment (sandbox, aat, prod etc..)"
}

variable "location" {
  type    = "string"
  description = "The location where you would like to deploy your infrastructure"
  default = "UK South"
}

variable "tenant_id" {
  description = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. This is usually sourced from environment variables and not normally required to be specified."
}

variable "jenkins_AAD_objectId" {
  description = "(Required) The Azure AD object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
}

variable "product_group_object_id" {
  default = "3e235565-1054-4b83-86c1-318d05dd4342"
  description = "dcd_group_accessmanagement_v2"
}

variable "managed_identity_object_id" {
  default = ""
}

// ASP Specific Variables
variable "asp_capacity" {
  type    = "string"
  default = "1"
}

variable "asp_sku_size" {
  type    = "string"
  default = "I2"
}

// AppInsights
// as of now, UK South is unavailable for Application Insights
variable "appinsights_location" {
  type        = "string"
  default     = "West Europe"
  description = "Location for Application Insights"
}

variable "application_type" {
  type        = "string"
  default     = "Web"
  description = "Type of Application Insights (Web/Other)"
}

// TAG SPECIFIC VARIABLES
variable "team_name" {
  type        = "string"
  description = "The name of your team"
  default     = "Access Management"
}

variable "team_contact" {
  type        = "string"
  description = "The name of your Slack channel people can use to contact your team about your infrastructure"
  default     = "#am-team"
}

// Other
variable "destroy_me" {
  type        = "string"
  default     = "false"
}
