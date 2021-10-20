resource "aws_lb" "splunk_sc4s" {
  name               = "splunk-sc4s-lb"
  internal           = true
  load_balancer_type = "network"
  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "splunk_sc4s_514" {
  name        = "splunk-sc4s-lb-tg-514"
  port        = 514
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_514" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 514
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-514"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_514.arn
  }
}

resource "aws_lb_target_group" "splunk_sc4s_1514" {
  name        = "splunk-sc4s-lb-tg-1514"
  port        = 1514
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_1514" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 1514
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-1514"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_1514.arn
  }
}

resource "aws_lb_target_group" "splunk_sc4s_50512" {
  name        = "splunk-sc4s-lb-tg-50512"
  port        = 50512
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_50512" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 50512
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-50512"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_50512.arn
  }
}
resource "aws_lb_target_group" "splunk_sc4s_50513" {
  name        = "splunk-sc4s-lb-tg-50513"
  port        = 50513
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_50513" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 50513
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-50513"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_50513.arn
  }
}
resource "aws_lb_target_group" "splunk_sc4s_50514" {
  name        = "splunk-sc4s-lb-tg-50514"
  port        = 50514
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_50514" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 50514
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-50514"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_50514.arn
  }
}
resource "aws_lb_target_group" "splunk_sc4s_50515" {
  name        = "splunk-sc4s-lb-tg-50515"
  port        = 50515
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_50515" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 50515
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-50515"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_50515.arn
  }
}



# resource "aws_lb_target_group" "splunk_sc4s_50516" {
#   name        = "splunk-sc4s-lb-tg-50516"
#   port        = 50516
#   protocol    = "TCP_UDP"
#   target_type = "ip"
#   vpc_id      = aws_vpc.splunk_sc4s.id
#   preserve_client_ip = true
#   stickiness  {
#     enabled = true
#     type = "source_ip"
#   }
#   health_check {
#     enabled = true
#     protocol = "TCP"
#     port = 50510
#     
#   }
# }

# resource "aws_lb_listener" "splunk_sc4s_50516" {
#   load_balancer_arn = aws_lb.splunk_sc4s.arn
#   port              = 50516
#   protocol          = "TCP_UDP"
#   tags = {
#     name = "splunk-sc4s-lb-ln-50516"
#   }

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.splunk_sc4s_50516.arn
#   }
# }
resource "aws_lb_target_group" "splunk_sc4s_50517" {
  name        = "splunk-sc4s-lb-tg-50517"
  port        = 50517
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_50517" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 50517
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-50517"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_50517.arn
  }
}
resource "aws_lb_target_group" "splunk_sc4s_50518" {
  name        = "splunk-sc4s-lb-tg-50518"
  port        = 50518
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s_50518" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 50518
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-50518"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_50518.arn
  }
}
resource "aws_lb_target_group" "splunk_sc4s_50519" {
  name        = "splunk-sc4s-lb-tg-50519"
  port        = 50519
  protocol    = "TCP_UDP"
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
    port = 50510
    
  }
}

resource "aws_lb_listener" "splunk_sc4s" {
  load_balancer_arn = aws_lb.splunk_sc4s.arn
  port              = 50519
  protocol          = "TCP_UDP"
  tags = {
    name = "splunk-sc4s-lb-ln-50519"
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.splunk_sc4s_50519.arn
  }
}