# Configuração do backend Azure para armazenamento do estado remoto do Terraform

``` terraform
terraform {
    backend "azurerm" {
        resource_group_name   = "rg-terraform-backend"            // Nome do grupo de recursos para o backend
        storage_account_name  = "strecterraformbackend"           // Nome da conta de armazenamento para o backend
        container_name        = "terraform-tfstate"               // Nome do container de armazenamento
        key                   = "tf-az-#NOME_DO_RECURSO#.tfstate" // Nome do arquivo de estado remoto
    }

    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "3.5.0" // Versão requerida do provedor AzureRM
        }
    }
}
```