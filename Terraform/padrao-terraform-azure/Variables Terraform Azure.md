#Terraform #Azure #Cloud
```hcl
variable "admin_username" {
  type        = string
  default = "recadmin" // Nome de usuário do administrador da VM
}

variable "vm_size" {
  type        = string
  default = "Standard_B4ms" // Tamanho da VM que será criada (disco usado na VM)
}

variable "storage_account_type" {
  type        = string
  default = "StandardSSD_LRS" // Tipo de conta de armazenamento para os discos
}

variable "private_ip_address_allocation" {
  type        = string
  default = "Dynamic" // Alocação de endereço IP privado (Dynamic ou Static)
}

variable "passwordserveradmin" {
  type        = string
  default = "PasswordServerAdmin" // Senha para o administrador do servidor
}

variable "dns_servers" {
  type        = list(string)
  default     = [
    "xxx",
    "xxx"
  ] // Servidores DNS a serem usados pela VM
}
```
