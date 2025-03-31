data "vkcs_images_image" "compute" {
  visibility = "public"
  default    = true
  properties = {
    mcs_os_distro  = "ubuntu"
    mcs_os_version = "22.04"
  }
}

resource "vkcs_compute_keypair" "terraform_key" {
  name       = var.key_pair_name
  public_key = file(var.public_key_path)
}

resource "vkcs_compute_instance" "terraform_instance_1" {
  name               = "ITHUBterraforubuntu1-Golubov"
  image_id           = data.vkcs_images_image.compute.id
  flavor_id          = var.compute_flavor
  key_pair           = vkcs_compute_keypair.terraform_key.name
  security_group_ids = [vkcs_networking_secgroup.main_sg.id]
  availability_zone  = "MS1"

  block_device {
    uuid                  = data.vkcs_images_image.compute.id
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = 10
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    uuid = vkcs_networking_network.terraform_network.id
  }

  user_data = <<-EOF
    #cloud-config
    users:
      - name: ubuntu
        sudo: ALL=(ALL) NOPASSWD:ALL
        groups: users, admin
        shell: /bin/bash
        ssh-authorized-keys:
          - ${file(var.public_key_path)}
    EOF
}

resource "vkcs_compute_instance" "terraform_instance_2" {
  name               = "ITHUBterraforubuntu2-Golubov"
  image_id           = data.vkcs_images_image.compute.id
  flavor_id          = var.compute_flavor
  key_pair           = vkcs_compute_keypair.terraform_key.name
  security_group_ids = [vkcs_networking_secgroup.main_sg.id]
  availability_zone  = "GZ1"

  block_device {
    uuid                  = data.vkcs_images_image.compute.id
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = 10
    boot_index            = 0
    delete_on_termination = true
  }

  network {
    uuid = vkcs_networking_network.terraform_network.id
  }

  user_data = <<-EOF
    #cloud-config
    users:
      - name: ubuntu
        sudo: ALL=(ALL) NOPASSWD:ALL
        groups: users, admin
        shell: /bin/bash
        ssh-authorized-keys:
          - ${file(var.public_key_path)}
    EOF
}

output "instance_1_info" {
  value = {
    host_name = vkcs_compute_instance.terraform_instance_1.name
    ip        = vkcs_compute_instance.terraform_instance_1.access_ip_v4
  }
}

output "instance_2_info" {
  value = {
    host_name = vkcs_compute_instance.terraform_instance_2.name
    ip        = vkcs_compute_instance.terraform_instance_2.access_ip_v4
  }
}