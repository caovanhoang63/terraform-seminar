#!/bin/bash
set -ex
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
docker run \
      -e MYSQL_HOST=${db_host} \
      -e MYSQL_USER=${db_username} \
      -e MYSQL_PASSWORD=${db_password} \
      -e MYSQL_DATABASE=${db_name} \
      -p 80:3000 \
      caovanhoang204/express-seminar:latest
