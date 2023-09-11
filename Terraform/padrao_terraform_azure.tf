data "azure_resource_group" "name" {
    name = "nome-do-resource-group"
}

data "azure_key_vault" "kv-infraestrutura" {
    name           = nome-keyvout-azure
    resource_group = nome-do-resourcegroup-da-kv
}

data "azure_key_vault_secret" "PasswordServerAdmin" {
    name = var.PasswordServerAdmin
    key_vault_id = data.azure_key_vault.
}