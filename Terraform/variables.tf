# Nome de usuário do administrador da VM
variable "admin_username" {
  type        = string
  default     = "recadmin"
}

# Tamanho da VM que será criada
variable "vm_size" {
  type        = string
  default     = "Standard_B4ms" // --> Disco usado na VM
}

# Tipo de conta de armazenamento para os discos
variable "storage_account_type" {
  type        = string
  default     = "StandardSSD_LRS"
}

# Alocação de endereço IP privado (Dynamic ou Static)
variable "private_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
}

# Senha para o administrador do servidor
variable "passwordserveradmin" {
  type        = string
  default     = "PasswordServerAdmin"
}

# Servidores DNS a serem usados pela VM
variable "dns_servers" {
  type        = list(string)
  default     = ["10.160.1.164", "10.160.1.165"]
}
