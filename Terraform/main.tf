# Recurso de grupo Azure Resource Group
data "azurerm_resource_group" "res-2" {
  name = "xxx" // Preencher com o nome do grupo de recursos para implantação
}

# Chave do Azure Key Vault
data "azurerm_key_vault" "kv-infraestrutura" {
  name                = "xxx" // Nome do KeyVault, alterar de acordo com o ambiente
  resource_group_name = "xxx" // Nome do grupo de recursos da Key Vault, alterar de acordo com o ambiente
}

# Segredo do Azure Key Vault para a senha do servidor administrador
data "azurerm_key_vault_secret" "PasswordServerAdmin" {
  name         = var.passwordserveradmin
  key_vault_id = data.azurerm_key_vault.kv-infraestrutura.id
}

# Gerador de número inteiro aleatório
resource "random_integer" "id" {
  min = 111
  max = 999
}

# Máquina virtual Windows Azure
resource "azurerm_windows_virtual_machine" "res-1" {
  admin_username        = var.admin_username
  admin_password        = data.azurerm_key_vault_secret.PasswordServerAdmin.value  
  license_type          = "Windows_Server"
  location              = data.azurerm_resource_group.res-2.location
  name                  = "xxx" // Alterar nome da máquina conforme o padrão de exemplo
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
    storage_account_type = var.storage_account_type
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

# Interface de rede Azure Network Interface
resource "azurerm_network_interface" "res-0" {
  location            = data.azurerm_resource_group.res-2.location
  name                = format("xxx-%v", random_integer.id.result)
  resource_group_name = data.azurerm_resource_group.res-2.name
  dns_servers         = var.dns_servers 
  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = "xxx" // Preencher com a informação da VNet e Subnet
  }
  depends_on = [
    data.azurerm_resource_group.res-2,
  ]
}
