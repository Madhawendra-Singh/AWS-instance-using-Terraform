// the below is the code for a security group (video 35)
resource "aws_security_group" "allow_tls" {
  name        = "terraform-sg"
  description = "Made this security group using  terraform"
  
  dynamic "ingress"{//vid(36 dynamic block)
    for_each = "${var.ports}"
    iterator = port
    content {
    description      = "TLS from VPC"
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
}

// // the below code is static code for eack block we typed the above dynamically in security grpup
  # ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
    
  # }

  #  ingress {//web server
  #   description      = "TLS from VPC"
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  #  ingress {//https
  #   description      = "TLS from VPC"
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  # }

  #  ingress {//database
  #   description      = "TLS from VPC"
  #   from_port        = 3306
  #   to_port          = 3306
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
    
  # }
  #  ingress {//mongoDB
  #   description      = "TLS from VPC"
  #   from_port        = 27017
  #   to_port          = 27017
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
    
  # }