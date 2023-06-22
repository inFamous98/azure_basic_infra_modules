resource "azurerm_resource_group" "POC" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "test1" {
  name                     = "${var.azurerm_storage_account_name}"
  resource_group_name      = "${azurerm_resource_group.POC.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "network1" {
  name = "${var.network_name}"
  address_space = ["${var.network_range}"]
  location     = "${var.location}"
  resource_group_name = "${azurerm_resource_group.POC.name}"
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.subnet_name}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${var.network_name}"
  address_prefixes     = ["${var.subnet_range}"]
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.network_name}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  
  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id  = "${azurerm_subnet.subnet1.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "VM" {
  count = 2
  name                  = "${var.vm_name}"
  resource_group_name =  "${var.resource_group_name}"
  location = "${var.location}"
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "${var.vm_size}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}
