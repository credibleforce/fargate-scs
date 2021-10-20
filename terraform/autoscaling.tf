# resource "aws_appautoscaling_target" "ecs_target_1" {
#   max_capacity       = 1
#   min_capacity       = 1
#   resource_id        = "service/${aws_ecs_cluster.splunk_sc4s.name}/${aws_ecs_service.main_1.name}"
#   scalable_dimension = "ecs:service:DesiredCount"
#   service_namespace  = "ecs"
# }

# resource "aws_appautoscaling_target" "ecs_target_2" {
#   max_capacity       = 1
#   min_capacity       = 1
#   resource_id        = "service/${aws_ecs_cluster.splunk_sc4s.name}/${aws_ecs_service.main_2.name}"
#   scalable_dimension = "ecs:service:DesiredCount"
#   service_namespace  = "ecs"
# }

# resource "aws_appautoscaling_target" "ecs_target_3" {
#   max_capacity       = 1
#   min_capacity       = 1
#   resource_id        = "service/${aws_ecs_cluster.splunk_sc4s.name}/${aws_ecs_service.main_3.name}"
#   scalable_dimension = "ecs:service:DesiredCount"
#   service_namespace  = "ecs"
# }

# resource "aws_appautoscaling_target" "ecs_target_4" {
#   max_capacity       = 1
#   min_capacity       = 1
#   resource_id        = "service/${aws_ecs_cluster.splunk_sc4s.name}/${aws_ecs_service.main_4.name}"
#   scalable_dimension = "ecs:service:DesiredCount"
#   service_namespace  = "ecs"
# }

# resource "aws_appautoscaling_policy" "ecs_policy_memory_1" {
#   name               = "memory-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_1.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_1.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_1.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
#    }
 
#    target_value       = 80
#   }
# }
 
# resource "aws_appautoscaling_policy" "ecs_policy_cpu_1" {
#   name               = "cpu-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_1.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_1.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_1.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageCPUUtilization"
#    }
 
#    target_value       = 60
#   }
# }

# resource "aws_appautoscaling_policy" "ecs_policy_memory_2" {
#   name               = "memory-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_2.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_2.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_2.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
#    }
 
#    target_value       = 80
#   }
# }
 
# resource "aws_appautoscaling_policy" "ecs_policy_cpu_2" {
#   name               = "cpu-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_2.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_2.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_2.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageCPUUtilization"
#    }
 
#    target_value       = 60
#   }
# }
# resource "aws_appautoscaling_policy" "ecs_policy_memory_3" {
#   name               = "memory-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_3.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_3.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_3.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
#    }
 
#    target_value       = 80
#   }
# }
 
# resource "aws_appautoscaling_policy" "ecs_policy_cpu_3" {
#   name               = "cpu-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_3.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_3.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_3.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageCPUUtilization"
#    }
 
#    target_value       = 60
#   }
# }

# resource "aws_appautoscaling_policy" "ecs_policy_memory_4" {
#   name               = "memory-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_4.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_4.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_4.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
#    }
 
#    target_value       = 80
#   }
# }
 
# resource "aws_appautoscaling_policy" "ecs_policy_cpu_4" {
#   name               = "cpu-autoscaling"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.ecs_target_4.resource_id
#   scalable_dimension = aws_appautoscaling_target.ecs_target_4.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.ecs_target_4.service_namespace
 
#   target_tracking_scaling_policy_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ECSServiceAverageCPUUtilization"
#    }
 
#    target_value       = 60
#   }
# }