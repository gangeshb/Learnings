packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "base" {
  ami_name      = "base-ami-v3"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami    = "ami-03cb1380eec7cc118"
  vpc_id        = "vpc-0080bc3774c350186"
  subnet_id     = "subnet-06918218607cffd10"
  ssh_username  = "ec2-user"
  iam_instance_profile = "BaseRole"
}

build {
  name    = "base-16-20-ami-build-name"
  sources = ["source.amazon-ebs.base"]

#  provisioner "shell" {
#    script = "./listAmis.sh"
#    environment_vars = ["AMI_NAME=$(toString .Source.AmiName)"]
#  }

  provisioner "shell" {
    script = "./base_script.sh"
    pause_before = "10s"
    timeout      = "20m"
  }
}
