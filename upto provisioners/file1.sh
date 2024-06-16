#!/bin/bash
sudo yum -y update
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Installed httpd server thru terraform</h1>" > /var/www/html/index.html