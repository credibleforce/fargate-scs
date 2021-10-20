resource "aws_ecs_task_definition" "splunk_sc4s_1" {
  family                   = "splunk_sc4s_1"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode(
    [
      {
        "environment" : [
          { "name" : "SPLUNK_HEC_URL", "value" : "https://${aws_lb.splunk.dns_name}:8088" },
          { "name" : "SPLUNK_HEC_TOKEN", "value" : "YOUR_HEC_TOKEN_HERE" },
          { "name" : "SC4S_SOURCE_TLS_ENABLE", "value" : "no" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_TLS_VERIFY", "value" : "no" },
          { "name" : "SC4S_LISTEN_DEFAULT_TCP_PORT", "value" : "514,50510" },
          { "name" : "SC4S_LISTEN_DEFAULT_UDP_PORT", "value" : "514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_TCP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_UDP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_TCP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_UDP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_TCP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_UDP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_TCP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_UDP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_TCP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_UDP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_TCP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_UDP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_TCP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_UDP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_TCP_PORT", "value" : "50519" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_UDP_PORT", "value" : "50519" },
          { "name" : "SC4S_ARCHIVE_GLOBAL", "value" : "no" },
          { "name" : "SC4S_LISTEN_CHECKPOINT_SPLUNK_NOISE_CONTROL", "value" : "yes" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_FALLBACK_INDEX", "value" : "shared_ev_infra_prod" }
        ],
        "essential" : true,
        "image" : "splunk/scs:latest",
        "memory" : 128,
        "name" : "${var.name}-container-${var.environment}-1",
        "portMappings" : [
          {
            "containerPort" : 50510,
            "hostPort" : 50510,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 514,
            "hostPort" : 514,
            "protocol" : "udp"
          },
          {
            "containerPort" : 1514,
            "hostPort" : 1514,
            "protocol" : "udp"
          },
          {
            "containerPort" : 50512,
            "hostPort" : 50512,
            "protocol" : "udp"
          },
           {
            "containerPort" : 50513,
            "hostPort" : 50513,
            "protocol" : "udp"
          },
          {
            "containerPort" : 50514,
            "hostPort" : 50514,
            "protocol" : "udp"
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

resource "aws_ecs_task_definition" "splunk_sc4s_2" {
  family                   = "splunk_sc4s_2"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode(
    [
      {
        "environment" : [
          { "name" : "SPLUNK_HEC_URL", "value" : "https://${aws_lb.splunk.dns_name}:8088" },
          { "name" : "SPLUNK_HEC_TOKEN", "value" : "YOUR_HEC_TOKEN_HERE" },
          { "name" : "SC4S_SOURCE_TLS_ENABLE", "value" : "no" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_TLS_VERIFY", "value" : "no" },
          { "name" : "SC4S_LISTEN_DEFAULT_TCP_PORT", "value" : "514,50510" },
          { "name" : "SC4S_LISTEN_DEFAULT_UDP_PORT", "value" : "514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_TCP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_UDP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_TCP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_UDP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_TCP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_UDP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_TCP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_UDP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_TCP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_UDP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_TCP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_UDP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_TCP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_UDP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_TCP_PORT", "value" : "50519" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_UDP_PORT", "value" : "50519" },
          { "name" : "SC4S_ARCHIVE_GLOBAL", "value" : "no" },
          { "name" : "SC4S_LISTEN_CHECKPOINT_SPLUNK_NOISE_CONTROL", "value" : "yes" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_FALLBACK_INDEX", "value" : "shared_ev_infra_prod" }
        ],
        "essential" : true,
        "image" : "splunk/scs:latest",
        "memory" : 128,
        "name" : "${var.name}-container-${var.environment}-2",
        "portMappings" : [
          {
            "containerPort" : 50510,
            "hostPort" : 50510,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 514,
            "hostPort" : 514,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 1514,
            "hostPort" : 1514,
            "protocol" : "tcp"
          },
          
          {
            "containerPort" : 50512,
            "hostPort" : 50512,
            "protocol" : "tcp"
          },
          
          {
            "containerPort" : 50513,
            "hostPort" : 50513,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 50514,
            "hostPort" : 50514,
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

resource "aws_ecs_task_definition" "splunk_sc4s_3" {
  family                   = "splunk_sc4s_3"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode(
    [
      {
        "environment" : [
          { "name" : "SPLUNK_HEC_URL", "value" : "https://${aws_lb.splunk.dns_name}:8088" },
          { "name" : "SPLUNK_HEC_TOKEN", "value" : "YOUR_SPLUNK_HEC_TOKEN_HERE" },
          { "name" : "SC4S_SOURCE_TLS_ENABLE", "value" : "no" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_TLS_VERIFY", "value" : "no" },
          { "name" : "SC4S_LISTEN_DEFAULT_TCP_PORT", "value" : "514,50510" },
          { "name" : "SC4S_LISTEN_DEFAULT_UDP_PORT", "value" : "514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_TCP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_UDP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_TCP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_UDP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_TCP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_UDP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_TCP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_UDP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_TCP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_UDP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_TCP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_UDP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_TCP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_UDP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_TCP_PORT", "value" : "50519" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_UDP_PORT", "value" : "50519" },
          { "name" : "SC4S_ARCHIVE_GLOBAL", "value" : "no" },
          { "name" : "SC4S_LISTEN_CHECKPOINT_SPLUNK_NOISE_CONTROL", "value" : "yes" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_FALLBACK_INDEX", "value" : "shared_ev_infra_prod" }
        ],
        "essential" : true,
        "image" : "splunk/scs:latest",
        "memory" : 128,
        "name" : "${var.name}-container-${var.environment}-3",
        "portMappings" : [
          {
            "containerPort" : 50510,
            "hostPort" : 50510,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 50515,
            "hostPort" : 50515,
            "protocol" : "tcp"
          },
          # {
          #   "containerPort" : 50516,
          #   "hostPort" : 50516,
          #   "protocol" : "tcp"
          # },
          {
            "containerPort" : 50517,
            "hostPort" : 50517,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 50518,
            "hostPort" : 50518,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 50519,
            "hostPort" : 50519,
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

resource "aws_ecs_task_definition" "splunk_sc4s_4" {
  family                   = "splunk_sc4s_4"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode(
    [
      {
        "environment" : [
          { "name" : "SPLUNK_HEC_URL", "value" : "https://${aws_lb.splunk.dns_name}:8088" },
          { "name" : "SPLUNK_HEC_TOKEN", "value" : "YOUR_HEC_TOKEN_HERE" },
          { "name" : "SC4S_SOURCE_TLS_ENABLE", "value" : "no" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_TLS_VERIFY", "value" : "no" },
          { "name" : "SC4S_LISTEN_DEFAULT_TCP_PORT", "value" : "514,50510" },
          { "name" : "SC4S_LISTEN_DEFAULT_UDP_PORT", "value" : "514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_TCP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_VMWARE_VSPHERE_UDP_PORT", "value" : "1514" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_TCP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ASA_UDP_PORT", "value" : "50512" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_TCP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_ACS_UDP_PORT", "value" : "50513" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_TCP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_IOS_UDP_PORT", "value" : "50514" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_TCP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_CISCO_UCS_UDP_PORT", "value" : "50515" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_TCP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_F5_BIGIP_UDP_PORT", "value" : "50517" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_TCP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_NETAPP_ONTAP_UDP_PORT", "value" : "50518" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_TCP_PORT", "value" : "50519" },
          { "name" : "SC4S_LISTEN_PALOALTO_PANOS_UDP_PORT", "value" : "50519" },
          { "name" : "SC4S_ARCHIVE_GLOBAL", "value" : "no" },
          { "name" : "SC4S_LISTEN_CHECKPOINT_SPLUNK_NOISE_CONTROL", "value" : "yes" },
          { "name" : "SC4S_DEST_SPLUNK_HEC_FALLBACK_INDEX", "value" : "shared_ev_infra_prod" }
        ],
        "essential" : true,
        "image" : "splunk/scs:latest",
        "memory" : 128,
        "name" : "${var.name}-container-${var.environment}-4",
        "portMappings" : [
          {
            "containerPort" : 50510,
            "hostPort" : 50510,
            "protocol" : "tcp"
          },
          {
            "containerPort" : 50515,
            "hostPort" : 50515,
            "protocol" : "udp"
          },
          # {
          #   "containerPort" : 50516,
          #   "hostPort" : 50516,
          #   "protocol" : "udp"
          # },
          {
            "containerPort" : 50517,
            "hostPort" : 50517,
            "protocol" : "udp"
          },
          {
            "containerPort" : 50518,
            "hostPort" : 50518,
            "protocol" : "udp"
          },
          {
            "containerPort" : 50519,
            "hostPort" : 50519,
            "protocol" : "udp"
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