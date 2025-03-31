terraform {
    required_providers {
        vkcs = {
            source = "vk-cs/vkcs"
        }
    }
}

provider "vkcs" {
    username = "golubovnn23@st.ithub.ru"
    password = var.vkcs_password
    project_id = "259eb7c6129a46f6b01062f53d57b9f8"
    region = "RegionOne"
    auth_url = "https://infra.mail.ru:35357/v3/"
}
