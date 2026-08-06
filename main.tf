resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "free_tier" {
  ami                    = "ami-00adafae70b8029d8" # Redhat Linux Server 2023 LTS
  instance_type          = "t3.micro"              # Free Tier eligible
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "sai-demo2-bucket-20260801"

  tags = {
    Name        = "example-bucket"
    Environment = "dev"
  }
}
