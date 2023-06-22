resource "azurerm_resource_group" "POC" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "test1" {
  name                     = var.azurerm_storage_account_name
  resource_group_name      = azurerm_resource_group.POC.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "network1" {
  name                = var.network_name
  address_space       = var.network_range
  location            = var.location
  resource_group_name = azurerm_resource_group.POC.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.network_name
  address_prefixes     = var.subnet_range
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.network_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "VM" {
  count                = var.vm_count
  name                 = "${var.vm_name}-${count.index}"
  resource_group_name  = var.resource_group_name
  location             = var.location
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size              = var.vm_sizes[count.index]

  storage_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  storage_os_disk {
    name              = "myosdisk1-${count.index}"
    caching           = var.vm_os_disk_caching
    create_option     = var.vm_os_disk_create_option
    managed_disk_type = var.vm_os_disk_managed_disk_type
    disk_size_gb      = var.vm_os_disk_size_gb
  }

  dynamic "storage_data_disk" {
    for_each = var.vm_data_disk_sizes[count.index]

    content {
      name              = "datadisk-${count.index}-${storage_data_disk.key}"
      create_option     = "Empty"
      managed_disk_type = "Standard_LRS"
      disk_size_gb      = storage_data_disk.value
      lun               = count.index
      caching           = var.vm_data_disk_caching
    }
  }
}
