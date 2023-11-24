include .env
export

.PHONY: build run

build:
	packer build ubuntu.pkr.hcl

run:
	docker run -d --name my-ubuntu-container ${IMAGE_NAME}:latest
	docker ps -a
