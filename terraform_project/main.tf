terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "ubuntu_server" {
  name	       = "python:3.9-slim"
  keep_locally = false
}

resource "docker_container" "app_server" {
  image = docker_image.ubuntu_server.image_id
  name  = "ansible_target_server"

  # Perintah agar container tidak mati (sleep selamanya)
  command = ["sleep", "infinity"]
}

