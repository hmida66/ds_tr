
#config provider
provider "azurerm" {
  features {}
}
#creation of ressourse grp 
resource "azurerm_resource_group" "azuretest" {
  name     = "${var.name}-test"
  location = "${var.location}"
}
#creation du resau virtuel
resource "azurerm_virtual_network" "azuretest" {
  name                = "${var.name}-vnet"
  location            = "${azurerm_resource_group.azuretest.location}"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"
  address_space       = "${var.ad_space}"
}
#creation de sous_réseau 1
resource "azurerm_subnet" "subnet1" {
  name                 = "${var.name}-subnet-test"
  resource_group_name  = "${azurerm_resource_group.azuretest.name}"
  virtual_network_name = "${azurerm_virtual_network.azuretest.name}"
  address_prefixes     = "${var.prefix1}"

}
#creation de sous_réseau 2
resource "azurerm_subnet" "subnet2" {
  name                 = "${var.name}-subnet-test2"
  resource_group_name  = "${azurerm_resource_group.azuretest.name}"
  virtual_network_name = "${azurerm_virtual_network.azuretest.name}"
  address_prefixes     = "${var.prefix2}"
}
#creation de sous_réseau 3
resource "azurerm_subnet" "subnet3" {
  name                 = "${var.name}-subnet-test3"
  resource_group_name  = "${azurerm_resource_group.azuretest.name}"
  virtual_network_name = "${azurerm_virtual_network.azuretest.name}"
  address_prefixes     = "${var.prefix3}"

}
#creation et configuration de la carte resaux
resource "azurerm_network_interface" "int1" {
  name                = "${var.name}-nic-test"
  location            = "${azurerm_resource_group.azuretest.location}"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"
  ip_configuration {
    name                          = "${var.name}-nic-ip-config"
    subnet_id                     = "${azurerm_subnet.subnet1.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pub1.id}"

  }
}
resource "azurerm_network_interface" "int2" {
  name                = "${var.name}-nic-test2"
  location            = "${azurerm_resource_group.azuretest.location}"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"
  ip_configuration {
    name                          = "${var.name}-nic-test2-ip-config"
    subnet_id                     = "${azurerm_subnet.subnet2.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pub2.id}"

  }
}
resource "azurerm_network_interface" "int3" {
  name                = "${var.name}-nic-test3"
  location            = "${azurerm_resource_group.azuretest.location}"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"
  ip_configuration {
    name                          = "${var.name}-nic-test3-ip-config"
    subnet_id                     = "${azurerm_subnet.subnet3.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pub3.id}"

  }
}
resource "azurerm_public_ip" "pub1" {
  name                = "${var.name}-public-ip1"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"
  location            = "${azurerm_resource_group.azuretest.location}"
  allocation_method   = "Static"
}
resource "azurerm_public_ip" "pub2" {
  name                = "${var.name}-public-ip2"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"
  location            = "${azurerm_resource_group.azuretest.location}"
  allocation_method   = "Static"
}
resource "azurerm_public_ip" "pub3" {
  name                = "${var.name}-public-ip3"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"
  location            = "${azurerm_resource_group.azuretest.location}"
  allocation_method   = "Static"
}

#Creation de la machine virtuelle 1
resource "azurerm_linux_virtual_machine" "vm1" {
  name                            = "${var.name}-vm1.test"
  location                        = "${azurerm_resource_group.azuretest.location}"
  resource_group_name             = "${azurerm_resource_group.azuretest.name}"
   network_interface_ids           = [
    azurerm_network_interface.int1.id,
    ]
  size                            = "Standard_B1s"
  computer_name                   = "azureVm.Test1"
  admin_username                  = "${var.username}"
  admin_password                  = "${var.password}"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  os_disk {
    name                 = "${var.name}-os-disk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }


}
#Creation de la machine virtuelle 2
resource "azurerm_linux_virtual_machine" "vm2" {
  name                            = "${var.name}-vm.test2"
  location                        = "${azurerm_resource_group.azuretest.location}"
  resource_group_name             = "${azurerm_resource_group.azuretest.name}"
   network_interface_ids           = [
    azurerm_network_interface.int2.id,
    ]
  size                            = "Standard_B1s"
  computer_name                   = "azureVm.Test2"
  admin_username                  = "${var.username}"
  admin_password                  = "${var.password}"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  os_disk {
    name                 = "${var.name}-os-disk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }


}
#Creation de la machine virtuelle 3
resource "azurerm_linux_virtual_machine" "azuretest3" {
  name                            = "${var.name}-test3"
  location                        = "${azurerm_resource_group.azuretest.location}"
  resource_group_name             = "${azurerm_resource_group.azuretest.name}"
  network_interface_ids           = [
    azurerm_network_interface.int3.id,
    ]
  size                            = "Standard_B1s"
  computer_name                   = "azureVm.Test3"
  admin_username                  = "${var.username}"
  admin_password                  = "${var.password}"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  os_disk {
    name                 = "${var.name}-os-disk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
#creation du compte de stockage

resource "azurerm_storage_account" "azuretest" {
  name                = "${var.nameaccount}"
  resource_group_name = "${azurerm_resource_group.azuretest.name}"

  location                 = "${azurerm_resource_group.azuretest.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
#container creation
resource "azurerm_storage_container" "azuretest" {
  name                  = "${var.namecontainer}"
  storage_account_name  = "${azurerm_storage_account.azuretest.name}"
  container_access_type = "private"
}
