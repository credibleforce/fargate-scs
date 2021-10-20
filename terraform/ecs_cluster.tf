resource "aws_ecs_cluster" "splunk_sc4s" {
  name = "${var.name}-cluster"
}