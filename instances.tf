data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "splunk-SH-server" {
  ami                         = "ami-00b7cc7d7a9f548ea"
  instance_type               = var.instance_type
  count                       = 2
  key_name                    = "windows-key"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("splunk-install.sh")
  tags = {
    Name = "${var.env_prefix}-SH-${count.index + 1}"
  }
}

resource "aws_instance" "splunk-IDX-server" {
  ami                         = "ami-00b7cc7d7a9f548ea"
  instance_type               = var.instance_type
  count                       = 2
  key_name                    = "windows-key"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("splunk-install.sh")
  tags = {
    Name = "${var.env_prefix}-IDX-${count.index + 1}"
  }
}

resource "aws_instance" "splunk-DP-server" {
  ami                         = "ami-00b7cc7d7a9f548ea"
  instance_type               = var.instance_type
  count                       = 1
  key_name                    = "windows-key"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("splunk-install.sh")
  tags = {
    Name = "${var.env_prefix}-DP"
  }
}

resource "aws_instance" "splunk-CM-server" {
  ami                         = "ami-00b7cc7d7a9f548ea"
  instance_type               = var.instance_type
  count                       = 1
  key_name                    = "windows-key"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("splunk-install.sh")
  tags = {
    Name = "${var.env_prefix}-CM}"
  }
}

resource "aws_instance" "splunk-DS-server" {
  ami                         = "ami-00b7cc7d7a9f548ea"
  instance_type               = var.instance_type
  count                       = 1
  key_name                    = "windows-key"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("splunk-install.sh")
  tags = {
    Name = "${var.env_prefix}-DS"
  }
}



resource "aws_instance" "ansible-server" {
  ami                         = "ami-00b7cc7d7a9f548ea"
  instance_type               = var.instance_type
  key_name                    = "windows-key"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("UF-script.sh")
  tags = {
    Name = "${var.env_prefix}-Linux-UF"
  }
}

resource "aws_instance" "windows_server" {
  ami                         = "ami-05044d26cbbf3c8cf"  # Windows Server 2023 AMI ID
  instance_type               = var.instance_type
  key_name                    = "windows-key"           # Assuming this is a specific key for Windows instances
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  #user_data                   = file("ScriptName.sh")

  tags = {
    Name = "${var.env_prefix}-Win-UF"
  }
}


