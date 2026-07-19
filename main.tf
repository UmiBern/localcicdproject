terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "devops_project" {
  name = "devops_project:latest"

  build {
    context = "."
  }
}

resource "docker_container" "devops_project" {
  name  = "devops_project_container"
  image = docker_image.devops_project.image_id

  ports {
    internal = 80
    external = var.host_port
  }

  restart = "unless-stopped"
}