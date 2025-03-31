variable "compute_flavor" {
  type = string
  default = "STD2-2-2"
}
variable "key_pair_name" {
  type = string
  default = "keypair-terraform"
}
variable "vkcs_password" {
  type      = string
  sensitive = true
  description = "Password for VK Cloud account" # пароль убран в отдельный файл!
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}