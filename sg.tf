# Security Group
resource "aws_security_group" "web_server_sg" {
  name        = "secure_sg"
  description = "Allow only SSH and HTTP access"
  vpc_id = aws_vpc.vpc1.id 

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "SSH from specific IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["72.82.255.92/32"] # replace with my IP address
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocals
    cidr_blocks = ["0.0.0.0/0"]
  }

tags = {
    Name = "web-server-security_group"
  }
  depends_on = [ aws_vpc.vpc1 ]
} 