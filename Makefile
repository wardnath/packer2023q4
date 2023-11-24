include .env
export

.PHONY: build run

build:
	packer build -var 'image_name=${IMAGE_NAME}:20.04' ubuntu.pkr.hcl

run:
	docker run -d --name my-ubuntu-container ${IMAGE_NAME}:latest
	docker ps -a
