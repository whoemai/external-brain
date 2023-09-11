data "azure_resource_group" "name" {
    name = "nome-do-resource-group"
}

data "azure_key_vault_secret" "PasswordServerAdmin" {
    name = "nome-keyvout-azure"
}