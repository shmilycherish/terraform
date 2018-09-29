variable "ami_id" {
  description = "ami id"
}

variable "aws_instance_type" {
  description = "aws instance type"
}

variable "key_name" {
  description = "Name of your AWS key pair"
}

variable "key_path" {
  description = "path to your private key file"
}

variable "tag_name" {
  description = "name of tags"
}

variable "http_port" {
  description = "define a variable http_port"
}

variable "ssh_port" {
  description = "define a variable ssh_port"
}

variable "domain_name" {
  description = "domain name under workshop.oc-tw.net."
}

variable "zone_id" {
  description = "hosted zone id"
}

