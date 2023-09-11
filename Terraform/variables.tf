variable "admin_username" {
  type        = string
  default     = "recadmin"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B4ms" // --> Disco usado na vm
}

variable "storage_account_type" {
  type        = string
  default     = "StandardSSD_LRS"
}

variable "private_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
}

variable "passwordserveradmin" {
  type        = string
  default     = "PasswordServerAdmin"
}

variable "dns_servers" {
  type        = list(string)
  default     = ["xxx","xxx"]
}