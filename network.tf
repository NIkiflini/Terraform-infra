resource "vkcs_networking_network" "terraform_network" {
  name = "ITHUBterraformnetwork-Golubov"
}

resource "vkcs_networking_subnet" "terraform_subnet" {
  name = "ITHUBterraformsubnet-Golubov"
  network_id = vkcs_networking_network.terraform_network.id
  cidr = "192.168.254.0/24"
}

resource "vkcs_networking_router" "terraform_router" {
  name = "ITHUBterraformrouter-Golubov"
  external_network_id = "298117ae-3fa4-4109-9e08-8be5602be5a2" 
}

resource "vkcs_networking_router_interface" "router_interface" {
  router_id = vkcs_networking_router.terraform_router.id
  subnet_id = vkcs_networking_subnet.terraform_subnet.id
}


