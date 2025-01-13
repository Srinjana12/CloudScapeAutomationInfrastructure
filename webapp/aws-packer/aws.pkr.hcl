packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0, < 2.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "source_ami" {
  type    = string
  default = "ami-0ea3c35c5c3284d82"
}

variable "vpc_id" {
  type    = string
  default = "vpc-05f8d911629300597"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0e936dbdf6dbcc408"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "envfile" {
  type    = string
  default = "./install.sh"
}

variable "additional_account_id" {
  type    = string
  default = null
}

source "amazon-ebs" "ubuntu-webapp" {
  region                      = var.region
  source_ami                  = var.source_ami
  instance_type               = var.instance_type
  ssh_username                = var.ssh_username
  ami_users                   = var.additional_account_id != null ? [var.additional_account_id] : []
  ami_name                    = "webappServer-{{timestamp}}"
  ami_description             = "webappServer_vm-ubuntu-24-04-lts-${formatdate("YYYY_MM_DD_HH_MM", timestamp())}"
  vpc_id                      = var.vpc_id
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags = {
    Name = "WebServer App AMI"
  }
}


build {
  sources = ["source.amazon-ebs.ubuntu-webapp"]

  
  provisioner "file" {
    source      = var.envfile
    destination = "/home/ubuntu/.env"
  }

  
  provisioner "file" {
    source      = "../app.py"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "../config.py"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "../conftest.py"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "../models.py"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "../routes.py"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "../test_app.py"
    destination = "/tmp/"
  }
  provisioner "file" {
    source      = "../requirements.txt"
    destination = "/tmp/"
  }


  provisioner "shell" {
    script = "install.sh"
  }

  
  provisioner "shell" {
    script = "flask_setup.sh"
  }

  post-processor "manifest" {
    output     = "manifest.json"
    strip_path = true
  }
}
