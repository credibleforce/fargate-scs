resource "aws_ecs_task_definition" "splunk" {
  family                   = "splunk"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 2048
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode(
    [
      {
        "environment" : [
          { "name" : "SPLUNK_PASSWORD", "value" : "1-splunk-password" },
          { "name" : "SPLUNK_START_ARGS", "value" : "--accept-license" },
          { "name" : "SPLUNK_HEC_TOKEN", "value" : "YOUR_HEC_TOKEN_HERE" },
          { "name" : "TEST_SC4S_ACTIVATE_EXAMPLES", "value" : "yes" },
        ],
        "essential" : true,
        "image" : "splunk/splunk:latest",
        "cpu" : 10,
        "memory" : 2048,
        "name" : "splunk",
        "portMappings" : [
          {
            "containerPort" : 8000,
            "hostPort" : 8000,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 8088,
            "hostPort" : 8088,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 9997,
            "hostPort" : 9997,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 8089,
            "hostPort" : 8089,
            "protocol" : "tcp"
          },
        ],
        "logConfiguration": {
          "logDriver": "awslogs"
          "options": {
            "awslogs-group": aws_cloudwatch_log_group.main.name
            "awslogs-stream-prefix": "ecs"
            "awslogs-region": var.region
          }
        }
      }
    ]
  )
  
}