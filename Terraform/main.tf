data "azurerm_resource_group" "res-2" {
  name = "xxx" // Preencher com a resource group que ira fazer deploy
}
data "azurerm_key_vault" "kv-infraestrutura" {
  name                = "xxx" // KeyVault name, alterar conforme ambiente
  resource_group_name = "xxx" // resourceGroup da kv, alterar conforme ambiente
}
data "azurerm_key_vault_secret" "PasswordServerAdmin" {
name         = var.passwordserveradmin
key_vault_id = data.azurerm_key_vault.kv-infraestrutura.id
}
resource "random_integer" "id" {
  min = 111
  max = 999
}
resource "azurerm_windows_virtual_machine" "res-1" {
  admin_username        = var.admin_username
  admin_password        = data.azurerm_key_vault_secret.PasswordServerAdmin.value  
  license_type          = "Windows_Server"
  location              = data.azurerm_resource_group.res-2.location
  name                  = "xxx" // Alterar nome da maquina conforme padrão de exemplo (RECAZBRSLDEV001): RECAZ (Recovery Azure) BRS (Localização Brasil South) W (Sistema Operacional) DEV (Ambiente) 001 (Sequencia da maquina)
  network_interface_ids = [azurerm_network_interface.res-0.id]
  resource_group_name   = data.azurerm_resource_group.res-2.name
  size                  = var.vm_size
  zone                  = "1"
  boot_diagnostics {
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type // Padrão atribuido à variavel, mudar somente se necessario
  }
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-datacenter-gensecond"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.res-0,
  ]
}
resource "azurerm_network_interface" "res-0" {
  location            = data.azurerm_resource_group.res-2.location
  name                = format("xxx-%v", random_integer.id.result) // Alterar somente o nome da maquina (xxx)
  resource_group_name = data.azurerm_resource_group.res-2.name
  dns_servers         = var.dns_servers 
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = "xxx" // Preencher essa informação conforme vnet e snet
  }
  depends_on = [
    data.azurerm_resource_group.res-2,
  ]
}