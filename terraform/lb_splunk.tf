resource "aws_lb" "splunk" {
  name               = "splunk-lb"
  internal           = true
  load_balancer_type = "network"
  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "splunk_8000" {
  load_balancer_arn = aws_lb.splunk.arn
  port              = 8000
  protocol          = "TCP"
  tags = {
    name = "splunk-lb-ln-8000"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_8000.arn
  }
}

resource "aws_lb_target_group" "splunk_8000" {
  name        = "splunk-lb-tg-8000"
  port        = 8000
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.splunk_sc4s.id
  preserve_client_ip = true
  stickiness  {
    enabled = true
    type = "source_ip"
  }
  health_check {
    enabled = true
    protocol = "TCP"
    port = 8000
    
  }
}

resource "aws_lb_listener" "splunk_8089" {
  load_balancer_arn = aws_lb.splunk.arn
  port              = 8089
  protocol          = "TCP"
  tags = {
    name = "splunk-lb-ln-8089"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_8089.arn
  }
}

resource "aws_lb_target_group" "splunk_8089" {
  name        = "splunk-lb-tg-8089"
  port        = 8089
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.splunk_sc4s.id
  preserve_client_ip = true
  stickiness  {
    enabled = true
    type = "source_ip"
  }
  health_check {
    enabled = true
    protocol = "TCP"
    port = 8000
    
  }
}

resource "aws_lb_listener" "splunk_8088" {
  load_balancer_arn = aws_lb.splunk.arn
  port              = 8088
  protocol          = "TCP"
  tags = {
    name = "splunk-lb-ln-8088"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_8088.arn
  }
}

resource "aws_lb_target_group" "splunk_8088" {
  name        = "splunk-lb-tg-8088"
  port        = 8088
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.splunk_sc4s.id
  preserve_client_ip = true
  stickiness  {
    enabled = true
    type = "source_ip"
  }
  health_check {
    enabled = true
    protocol = "TCP"
    port = 8000
  }
}

resource "aws_lb_listener" "splunk_9997" {
  load_balancer_arn = aws_lb.splunk.arn
  port              = 9997
  protocol          = "TCP"
  tags = {
    name = "splunk-lb-ln-9997"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_9997.arn
  }
}

resource "aws_lb_target_group" "splunk_9997" {
  name        = "splunk-lb-tg-9997"
  port        = 9997
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.splunk_sc4s.id
  preserve_client_ip = true
  stickiness  {
    enabled = true
    type = "source_ip"
  }
  health_check {
    enabled = true
    protocol = "TCP"
    port = 8000
    
  }
}