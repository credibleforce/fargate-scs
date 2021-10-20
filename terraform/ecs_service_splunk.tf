resource "aws_ecs_service" "splunk" {
  name                               = "splunk"
  cluster                            = aws_ecs_cluster.splunk_sc4s.id
  task_definition                    = aws_ecs_task_definition.splunk.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 600
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  wait_for_steady_state              = true

  network_configuration {
    security_groups  = aws_security_group.splunk.*.id
    subnets          = aws_subnet.public.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_8000.arn
    container_name   = "splunk"
    container_port   = 8000
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_8089.arn
    container_name   = "splunk"
    container_port   = 8089
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_8088.arn
    container_name   = "splunk"
    container_port   = 8088
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.splunk_9997.arn
    container_name   = "splunk"
    container_port   = 9997
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}