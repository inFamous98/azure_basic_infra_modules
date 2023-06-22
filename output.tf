output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.test1.name
}

output "virtual_network_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.network1.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = azurerm_subnet.subnet1.name
}

output "network_interface_ids" {
  description = "IDs of the created network interfaces"
  value       = azurerm_network_interface.nic[*].id
}
