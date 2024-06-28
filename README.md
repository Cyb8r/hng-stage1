Here's my submission of my HNG 11 Stage one task

# Static Website Deployment on Azure

This README provides guidiance on how to deploy a static website on Azure using Azure liux virtual machine and installing NGINX as the web server.

## Table of contents

1. Prerequistes
2. Azure VM Setup
3. Server Configuration
4. Website Deployment
5. Website Access

## Prerequisites

- An Azure account
- Basic knowledge of Linux commands
- SSH client (e.g., PuTTY or MobaXtem for Windows or Terminal for macOS/Linux)
- l Your static website files (HTML, CSS, JavaScript)

## Azure VM Setup

1. Login to the Azure Portal(https://portal.azure.com)
2. Create a new Vitual Machine
    - Click "Create a resource" > "VirtualMachine"
    - Select Ubuntu server 20.04 LTS or laterb versions. 
    - Ensure to select appropriate Virtual machine size.
    - Enable publicj inbound ports: SSH(22) AND HTTP(80)
    - Creat and download the ssh key or create a username and password. 
3. Note public Virtual machine Ip address.

## Server Configuration

1. SSH into the virtual machine:

        ssh -i <path-to-private-key> azureuser@<your-vm-ip>
        ssh -i azureuser@<your-vm-ip> prompt to login >> insert the passowrd previously configured.

2. Update the linux server:

         sudo apt update && sudo apt upgrade -y

3. Install NGINX:

        sudo apt install nginx -y

4. Start and enable NGINX:

         sudo systemctl start nginx
         sudo systemctl enable nginx

## Web Deployment

1. Upload the cotent of the website files to the virtual machine:

    git clone [https://](https://github.com/Cyb8r/hng-stage1.git) && cd hng-stage1/web

2. Copy files to NGINX's serving diretory:

    sudo mv * /var/www/html

3. Edit NGINX configuration:

        server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name_;

    add_header X-Powered-By "NGINX $nginx_version";

    location / {
        try_files $uri $uri/ =404;
        }
    }

4. Test NGINX configuration:

    sudo nginx -t

5. Reload NGINX:

    sudo systemctl reload nginx
