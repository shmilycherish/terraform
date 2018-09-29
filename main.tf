resource "aws_instance" "server" {
  ami                    = "ami-08569b978cc4dfa10"
  instance_type          = "t2.nano"
  vpc_security_group_ids = ["${aws_security_group.cherish.id}"]
  key_name               = "cherish"

  provisioner "file" {
    connection {
      user        = "ec2-user"
      private_key = "${file("~/Downloads/study/cherish.pem")}"
    }

    source      = "./html"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    connection {
      user        = "ec2-user"
      private_key = "${file("~/Downloads/study/cherish.pem")}"
    }

    inline = [
      "sudo yum install -y nginx",
      "sudo rm -rf /usr/share/nginx/html",
      "sudo  mv /tmp/html /usr/share/nginx",
      "sudo service nginx start",
    ]
  }

  tags {
    Name = "cy-terraform"
  }
}

resource "aws_security_group" "cherish" {
  name = "cherish"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "www" {
  name    = "cherish.workshop.oc-tw.net"
  type    = "A"
  zone_id = "Z2F25J92GG08RZ"
  ttl     = "900"
  records = ["${aws_instance.server.public_ip}"]
}
