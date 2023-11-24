variable "image_name" {
  type = string
  default = "ubuntu:20.04"
}

source "docker" "ubuntu" {
  image = var.image_name
  commit = true
}

build {
  sources = ["source.docker.ubuntu"]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "apt-get upgrade -y",
      // Additional provisioning commands
    ]
  }

  post-processor "docker-tag" {
    repository = "${env("IMAGE_NAME")}"
    tag = "latest"
  }
}
