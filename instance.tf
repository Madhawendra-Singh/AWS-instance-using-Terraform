//
//the below block is for creating ec2 instance
//
resource "aws_instance" "web" {
  ami           = "${var.image_id}"//our ami that we copied from our aws
  instance_type = "${var.instance_type}"
  key_name ="${aws_key_pair.key-tf.key_name}"//(video 34) here what we are doing is we are connecting the ssh key value to the instance that we are creating
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]//vide037 connecting security block to ec2 instance
  tags = {
    Name = "First_terraform-instance"
  }
  # user_data = <<-EOF
  # #!/bin/bash
  # sudo apt-get update
  # sudo apt-get install nginx -y
  # sudo echo "HI MAddy this was the task">/var/www/html/index.ngnix-debian.html
  # EOF
  connection { 
      type = "ssh"
      user = "ubuntu"
      private_key=file("${path.module}/id_rsa")
      host ="${self.public_ip}"
    }


}





