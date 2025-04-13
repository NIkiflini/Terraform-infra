variable "vkcs_username" {
  type        = string
  description = "VK Cloud account email" #mail
}

variable "vkcs_project_id" {
  type        = string
  sensitive   = true
  description = "VK Cloud API" #выбор проекта, настройки проекта, доступ по API
}

variable "key_pair_name" { #не меняй
  type    = string
  default = "vk-cloud-key"
}

variable "public_key_path" { #не меняй нужен ключ
  type    = string
  default = "~/.ssh/vk-cloud.pub"
}

variable "compute_flavor" { #NE MENAY
  type    = string
  default = "STD2-2-2"
}

variable "vkcs_password" { # sam sprosit parol ne menay
  type        = string
  sensitive   = true
  description = "Password for VK Cloud provider authentication"
}
