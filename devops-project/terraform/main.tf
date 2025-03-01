provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "flask_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # AMI של Ubuntu (בדוק לפי אזור)
  instance_type = "t2.micro"  # מתאים ל-AWS Free Tier
  key_name      = "my-key"    # שם מפתח SSH שלך
  tags = {
    Name = "FlaskAppInstance"
  }
}

output "instance_public_ip" {
  value = aws_instance.flask_instance.public_ip
}
