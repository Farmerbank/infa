variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-central-1"
}

variable "aws_amis" {
  default = {
    eu-west-1 = "ami-6c101b0a"
    us-east-1 = "ami-20631a36"
    us-west-1 = "ami-9fe6c7ff"
    us-west-2 = "ami-45224425"
    eu-central-1 = "ami-a74c95c8"
  }
}

variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/terraform.pub
DESCRIPTION

  default = "~/.ssh/id_yubikey.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "Yubikey Egbert Pot"
}

variable "ip_ranges" {
  default = ["0.0.0.0/0"]
}

variable "app" {
  type = "map"

  default = {
    user = "kwxbuild"
  }
}
