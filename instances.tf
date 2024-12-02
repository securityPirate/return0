# instances.tf

# Bastion Host in Management Subnet
resource "aws_instance" "bastion_host" {
  ami                         = var.instance_ami["awsami2_arm64"]
  instance_type               = "t4g.nano"
  subnet_id                   = aws_subnet.management_subnet.id
  vpc_security_group_ids      = [aws_security_group.management_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = true

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = 0.0025
      spot_instance_type = "one-time"
    }
  }

  tags = {
    Name = "BastionHost"
  }
}

# Static Analysis EC2 Instance
resource "aws_instance" "static_analysis_instance" {
  ami                         = var.instance_ami["windows_x86_64"]
  instance_type               = "t3a.medium"
  subnet_id                   = aws_subnet.static_analysis_subnet.id
  vpc_security_group_ids      = [aws_security_group.static_analysis_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = false

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = 0.022
      spot_instance_type = "one-time"
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  tags = {
    Name = "StaticAnalysisInstance"
  }
}

# Dynamic Analysis EC2 Instance
resource "aws_instance" "dynamic_analysis_instance" {
  ami                         = var.instance_ami["windows_x86_64"]
  instance_type               = "t3a.medium"
  subnet_id                   = aws_subnet.dynamic_analysis_subnet.id
  vpc_security_group_ids      = [aws_security_group.dynamic_analysis_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = false

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = 0.022
      spot_instance_type = "one-time"
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  tags = {
    Name = "DynamicAnalysisInstance"
  }
}

# Support Instances (Transfer Station, Logging Server, etc.)

resource "aws_instance" "transfer_station_instance" {
  ami                         = var.instance_ami["awsami2_arm64"]
  instance_type               = "t4g.nano"
  subnet_id                   = aws_subnet.support_subnet.id
  vpc_security_group_ids      = [aws_security_group.support_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = false

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = 0.0025
      spot_instance_type = "one-time"
    }
  }

  tags = {
    Name = "TransferStation"
  }
}

resource "aws_instance" "logging_server_instance" {
  ami                         = var.instance_ami["ubuntu_2404_arm64"]
  instance_type               = "t4g.small"
  subnet_id                   = aws_subnet.support_subnet.id
  vpc_security_group_ids      = [aws_security_group.support_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = false

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = 0.0085
      spot_instance_type = "one-time"
    }
  }

  tags = {
    Name = "LoggingServer"
  }
}
