variable "resource_group_name" {
  description = "Name of the resource group"
  default = "POC"
}

variable "location" {
  description = "Location for the resources"
  default = "East US"
}

variable "azurerm_storage_account_name" {
  description = "Name of the storage account"
  default = "storage1"
}

variable "network_name" {
  description = "Name of the virtual network"
  default = "network1"
}

variable "network_range" {
  description = "Address range for the virtual network"
  default        = ["192.168.0.0/8"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  default = ""
}

variable "subnet_range" {
  description = "Address range for the subnet"
  default        = ["192.168.0.0/16"]
}

variable "vm_name" {
  description = "Name of the virtual machine"
  default = "my-vm"
}

variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
}

variable "vm_sizes" {
  description = "Sizes of the virtual machines"
  type        = list(string)
}

variable "vm_image_publisher" {
  description = "Publisher of the virtual machine image"
  default = ""
}

variable "vm_image_offer" {
  description = "Offer of the virtual machine image"
  default = ""
}

variable "vm_image_sku" {
  description = "SKU of the virtual machine image"
  default = ""
}

variable "vm_image_version" {
  description = "Version of the virtual machine image"
  default = ""
}

variable "vm_os_disk_caching" {
  description = "Caching type for the OS disk"
  default = ""
}

variable "vm_os_disk_create_option" {
  description = "Create option for the OS disk"
  default = ""
}

variable "vm_os_disk_managed_disk_type" {
  description = "Managed disk type for the OS disk"
  default = "Standard_LRS"
}

variable "vm_os_disk_size_gb" {
  description = "Size of the OS disk in GB"
  type        = number
}

variable "vm_data_disk_sizes" {
  description = "Disk sizes for the data disks"
  type        = list(list(number))
}

variable "vm_data_disk_managed_disk_type" {
  description = "Managed disk type for the data disks"
  default = ""
}

variable "vm_data_disk_caching" {
  description = "Caching type for the data disks"
  default = ""
}
