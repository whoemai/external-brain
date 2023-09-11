data "azure_resource_group" "name" {
    name = "nome-do-resource-group"
}

data "azure_key_vault" "kv_infraestrutura" {
    name           = nome-keyvout-azure
    resource_group = nome-do-resourcegroup-da-kv
}

data "azure_key_vault_secret" "PasswordServerAdmin" {
    name = var.PasswordServerAdmin
    key_vault_id = data.azure_key_vault.kv_infraestrutura.id
}

resource "random_integer" "id" {
    min = 111
    max = 999
}

resource "azurerm_windows_virtual_machine" "res_1" {
    admin_username = 
    admin_password = 
    license_type = 
    location = 
    name = 
    network_interface_ids = 
    resource_group_name = 
    size = 
    
}