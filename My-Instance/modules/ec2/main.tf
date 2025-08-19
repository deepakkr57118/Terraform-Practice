resource "aws_instance" "app" {
  ami = "ami-084a7d336e816906b"
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_id]


  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install python3 -y
              echo '${file("app.py")}' > /home/ec2-user/app.py
              python3 /home/ec2-user/app.py &
              EOF

    tags = {
    Name = "AppInstance"
    }

  provisioner "file"  {
    source = "C:/Users/deepa/onedrive/Desktop/EC2_instance/modules/app.py"
    destination = "/home/ec2-user/app.py"
  }          
  
  provisioner "remote-exec" {
  inline = [
    "sudo yum install -y python3",
    "chmod +x /home/ec2-user/app.py",
    "python3 /home/ec2-user/app.py &"
  ]
  }


  connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:/Users/deepa/.ssh/id_rsa")
      host        = self.public_ip

  }    
}