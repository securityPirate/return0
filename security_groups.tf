# Management Security Group
resource "aws_security_group" "management_sg" {
  name        = "management_sg"
  description = "Security group for Management Subnet"
  vpc_id      = aws_vpc.Return0_lab_vpc.id
  tags = {
    Name = "ManagementSG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "management_ssh" {
  security_group_id = aws_security_group.management_sg.id
  description       = "Allow SSH from my IP"
  cidr_ipv4         = "127.0.0.1/32" # Replace with your public IP
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

# Static Analysis Security Group
resource "aws_security_group" "static_analysis_sg" {
  name        = "static_analysis_sg"
  description = "Security group for Static Analysis Subnet"
  vpc_id      = aws_vpc.Return0_lab_vpc.id
  tags = {
    Name = "StaticAnalysisSG"
  }
}
resource "aws_vpc_security_group_ingress_rule" "static_analysis_ingress" {
  security_group_id = aws_security_group.static_analysis_sg.id
  description       = "Allow access from mangement subnet"
  cidr_ipv4         = aws_subnet.management_subnet.cidr_block
  ip_protocol       = -1
}

# Dynamic Analysis Security Group
resource "aws_security_group" "dynamic_analysis_sg" {
  name        = "dynamic_analysis_sg"
  description = "Security group for Dynamic Analysis Subnet"
  vpc_id      = aws_vpc.Return0_lab_vpc.id
  tags = {
    Name = "DynamicAnalysisSG"
  }
}
resource "aws_vpc_security_group_ingress_rule" "dynamic_analysis_ingress" {
  security_group_id = aws_security_group.dynamic_analysis_sg.id
  description       = "Allow access from mangement subnet"
  cidr_ipv4         = aws_subnet.management_subnet.cidr_block
  ip_protocol       = -1
}


# Support Security Group
resource "aws_security_group" "support_sg" {
  name        = "support_sg"
  description = "Security group for Support Subnet"
  vpc_id      = aws_vpc.Return0_lab_vpc.id
  tags = {
    Name = "SupportSG"
  }
}
resource "aws_vpc_security_group_ingress_rule" "support_ingress" {
  security_group_id = aws_security_group.support_sg.id
  description       = "Allow access from mangement subnet"
  cidr_ipv4         = aws_subnet.management_subnet.cidr_block
  ip_protocol       = -1
}

resource "aws_vpc_security_group_ingress_rule" "support_from_static" {
  security_group_id            = aws_security_group.support_sg.id
  referenced_security_group_id = aws_security_group.static_analysis_sg.id
  ip_protocol                  = "-1"
  from_port                    = 0
  to_port                      = 0
}

resource "aws_vpc_security_group_ingress_rule" "support_from_dynamic" {
  security_group_id            = aws_security_group.support_sg.id
  referenced_security_group_id = aws_security_group.dynamic_analysis_sg.id
  ip_protocol                  = "-1"
  from_port                    = 0
  to_port                      = 0
}

