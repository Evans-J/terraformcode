resource "aws_lightsail_instance" "example" {
  name              = "example-lightsail-server"
  availability_zone = "us-east-1a"  # Set your desired availability zone
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "micro_2_0"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo bash -c 'echo "<h1>This Server is created using Terraform </h1>" >> /var/www/html/index.html'
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}
