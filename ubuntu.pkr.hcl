variable "input_image" {
  type = string
  default = "ubuntu:20.04"
}

variable "image_name" {
  type = string
  default = "my-ubuntu"
}

variable "image_tag" {
  type = string
  default = "v1"
}

source "docker" "ubuntu" {
  image = "${var.input_image}"
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
    repository = "${var.image_name}"
    tags = ["${var.image_tag}"]
  }
}
