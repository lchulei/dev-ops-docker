terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0" 
    }
  }
}

provider "docker" {
  registry_auth {
    address  = "https://index.docker.io/v1/"
    username = var.dockerhub_username
    password = var.dockerhub_password
  }
}

resource "docker_image" "my_app" {
  name = "lchulei/my_app:latest"
  build {
    context    = ""
    dockerfile = "./Dockerfile"
  }
}

variable "dockerhub_username" {
  description = "Ім'я користувача DockerHub"
}

variable "dockerhub_password" {
  description = "Пароль DockerHub"
  sensitive   = true
}


