variable "location" {
  description = "Azure Region"
  default     = "East US"
}

variable "resource_group_name"{
    description = "Resource group name variable"
    default = "POC"
}

variable "azurerm_storage_account_name" {
  description = "The Azure Storage Account Name for External Exhibitor"
  default     = "storage1"
}
variable "network_name" {
    description = "Name for network"
    default = "network1"
}

variable "network_range" {
    description = "Range of network"
    default = "192.168.0.0/8"
}

variable "subnet_name" {
    description = "Name of subnet"
    default = "subnet1"
}

variable "subnet_range" {
  description = "Private IP space to be used in CIDR format"
  default     = "192.168.0.0/16"
}

variable "vm_name" {
    description = "Name of created VM"
    default = "test1"
}

variable "admin_username" {
  description = "admin username"
  default     = "dcos_admin"
}

variable "admin_password" {
    description = "admin password"
    default = "S@dm!n@123"
}

variable "disk_type" {
  description = "Global Infra Disk Type"
  default     = "Standard_LRS"
}

variable "vm_size" {
  description = "Global Infra Machine Type"
  default     = "Standard_DS11_v2"
}