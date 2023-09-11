variable "admin_username" {
  type        = string
  default = "recadmin"
}

variable "vm_size" {
  type        = string
  default = "Standard_B4ms"
}

variable "storage_account_type" {
  type        = string
  default = "StandardSSD_LRS"
}

variable "private_ip_address_allocation" {
  type        = string
  default = "Dynamic"
}

variable "passwordserveradmin" {
  type        = string
  default = "PasswordServerAdmin"
}

variable "dns_servers" {
  type        = list(string)
  default     = ["10.160.1.164","10.160.1.165"]
}