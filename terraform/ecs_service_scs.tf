resource "aws_ecs_service" "main_1" {
  name                               = "${var.name}-service-${var.environment}-1"
  cluster                            = aws_ecs_cluster.splunk_sc4s.id
  task_definition                    = aws_ecs_task_definition.splunk_sc4s_1.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 600
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  wait_for_steady_state              = false

  network_configuration {
    security_groups  = aws_security_group.splunk_sc4s.*.id
    subnets          = aws_subnet.public.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_514.arn
    container_name   = "${var.name}-container-${var.environment}-1"
    container_port   = 514
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_1514.arn
    container_name   = "${var.name}-container-${var.environment}-1"
    container_port   = 1514
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50512.arn
    container_name   = "${var.name}-container-${var.environment}-1"
    container_port   = 50512
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50513.arn
    container_name   = "${var.name}-container-${var.environment}-1"
    container_port   = 50513
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50514.arn
    container_name   = "${var.name}-container-${var.environment}-1"
    container_port   = 50514
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
  depends_on    = [aws_ecs_service.splunk]
}

resource "aws_ecs_service" "main_2" {
  name                               = "${var.name}-service-${var.environment}-2"
  cluster                            = aws_ecs_cluster.splunk_sc4s.id
  task_definition                    = aws_ecs_task_definition.splunk_sc4s_2.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 600
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  wait_for_steady_state              = false

  network_configuration {
    security_groups  = aws_security_group.splunk_sc4s.*.id
    subnets          = aws_subnet.public.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_514.arn
    container_name   = "${var.name}-container-${var.environment}-2"
    container_port   = 514
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_1514.arn
    container_name   = "${var.name}-container-${var.environment}-2"
    container_port   = 1514
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50512.arn
    container_name   = "${var.name}-container-${var.environment}-2"
    container_port   = 50512
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50513.arn
    container_name   = "${var.name}-container-${var.environment}-2"
    container_port   = 50513
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50514.arn
    container_name   = "${var.name}-container-${var.environment}-2"
    container_port   = 50514
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
  depends_on    = [aws_ecs_service.splunk]
}

resource "aws_ecs_service" "main_3" {
  name                               = "${var.name}-service-${var.environment}-3"
  cluster                            = aws_ecs_cluster.splunk_sc4s.id
  task_definition                    = aws_ecs_task_definition.splunk_sc4s_3.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 600
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  wait_for_steady_state              = false

  network_configuration {
    security_groups  = aws_security_group.splunk_sc4s.*.id
    subnets          = aws_subnet.public.*.id
    assign_public_ip = true
  }
  
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50515.arn
    container_name   = "${var.name}-container-${var.environment}-3"
    container_port   = 50515
  }
  # load_balancer {
  #   target_group_arn = aws_lb_target_group.splunk_sc4s_50516.arn
  #   container_name   = "${var.name}-container-${var.environment}-3"
  #   container_port   = 50516
  # }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50517.arn
    container_name   = "${var.name}-container-${var.environment}-3"
    container_port   = 50517
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50518.arn
    container_name   = "${var.name}-container-${var.environment}-3"
    container_port   = 50518
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50519.arn
    container_name   = "${var.name}-container-${var.environment}-3"
    container_port   = 50519
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }

  depends_on    = [aws_ecs_service.splunk]
}

resource "aws_ecs_service" "main_4" {
  name                               = "${var.name}-service-${var.environment}-4"
  cluster                            = aws_ecs_cluster.splunk_sc4s.id
  task_definition                    = aws_ecs_task_definition.splunk_sc4s_4.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 600
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  wait_for_steady_state              = false

  network_configuration {
    security_groups  = aws_security_group.splunk_sc4s.*.id
    subnets          = aws_subnet.public.*.id
    assign_public_ip = true
  }
  
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50515.arn
    container_name   = "${var.name}-container-${var.environment}-4"
    container_port   = 50515
  }
  # load_balancer {
  #   target_group_arn = aws_lb_target_group.splunk_sc4s_50516.arn
  #   container_name   = "${var.name}-container-${var.environment}-4"
  #   container_port   = 50516
  # }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50517.arn
    container_name   = "${var.name}-container-${var.environment}-4"
    container_port   = 50517
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50518.arn
    container_name   = "${var.name}-container-${var.environment}-4"
    container_port   = 50518
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_sc4s_50519.arn
    container_name   = "${var.name}-container-${var.environment}-4"
    container_port   = 50519
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }

  depends_on    = [aws_ecs_service.splunk]
}