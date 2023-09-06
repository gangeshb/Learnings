packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "base" {
  ami_name      = "base-ami"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami    = "ami-0ed2f971d5898dd2d"
  vpc_id        = "vpc-0080bc3774c350186"
  subnet_id     = "subnet-06918218607cffd10"
  ssh_username  = "ec2-user"
  iam_instance_profile = "BaseRole"

}

build {
  name    = "base-16-20-ami-build-name"
  sources = ["source.amazon-ebs.base"]

  provisioner "shell" {
    script = "./base_script.sh"
    pause_before = "10s"
    timeout      = "30m"
  }


}
