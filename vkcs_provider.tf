terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
        }
    }
}

provider "vkcs" {
    # Your user account.
    username = var.vkcs_username

    # The password of the account
    password = var.vkcs_password

    project_id = var.vkcs_project_id

    # Region name
    region = "RegionOne"

    auth_url = "https://infra.mail.ru:35357/v3/"
}
