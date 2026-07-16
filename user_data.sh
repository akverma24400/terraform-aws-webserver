#!/bin/bash

apt-get update -y

apt-get install -y docker.io

systemctl enable docker
systemctl start docker

docker pull akash24400/terraform-website:v1

docker run -d \
  --name terraform-website \
  -p 80:80 \
  --restart unless-stopped \
  akash24400/terraform-website:v1