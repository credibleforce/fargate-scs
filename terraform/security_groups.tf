resource "aws_security_group" "splunk_sc4s" {
  name   = "${var.environment}-${var.name}-ecs-cluster-sg"
  vpc_id = aws_vpc.splunk_sc4s.id

  ingress {
    protocol  = "tcp"
    from_port = 514
    to_port   = 514

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "tcp"
    from_port = 1514
    to_port   = 1514

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "tcp"
    from_port = 50512
    to_port   = 50519

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "udp"
    from_port = 514
    to_port   = 514

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "udp"
    from_port = 1514
    to_port   = 1514

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "udp"
    from_port = 50512
    to_port   = 50519

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  # allow all within the VPC
  ingress {
    protocol  = "-1"
    from_port = 0
    to_port   = 0

    cidr_blocks = [var.cidr]
  }

  # allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name        = "${var.environment}-${var.name}-ecs-cluster-sg"
    environment = var.environment
  }
}

resource "aws_security_group" "splunk" {
  name   = "splunk-${var.name}-ecs-cluster-sg"
  vpc_id = aws_vpc.splunk_sc4s.id

  ingress {
    protocol  = "tcp"
    from_port = 8000
    to_port   = 8000

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "tcp"
    from_port = 8088
    to_port   = 8088

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "tcp"
    from_port = 8089
    to_port   = 8089

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }

  ingress {
    protocol  = "tcp"
    from_port = 9997
    to_port   = 9997

    cidr_blocks = [
      var.cidr,
      var.outside_cidr
    ]
  }


  # allow all within the VPC
  ingress {
    protocol  = "-1"
    from_port = 0
    to_port   = 0

    cidr_blocks = [var.cidr]
  }

  # allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name        = "splunk-${var.name}-ecs-cluster-sg"
    environment = var.environment
  }
}