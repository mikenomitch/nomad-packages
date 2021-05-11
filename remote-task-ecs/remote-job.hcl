job "nomad-ecs-demo" {
  datacenters = ["[[.datacenters]]"]
  group "ecs-remote-task-demo" {
    restart {
      attempts = 0
      mode     = "fail"
    }
    reschedule {
      delay = "5s"
    }
    task "http-server" {
      driver       = "ecs"
      kill_timeout = "1m" // increased from default to accomodate ECS.

      config {
        task {
          launch_type     = [[.launchType]]
          task_definition = [[.taskDefinition]]
          network_configuration {
            aws_vpc_configuration {
              assign_public_ip = "ENABLED"
              security_groups  = ["[[.securityGroup]]"]
              subnets          = ["[[.subNetIt]]"]
            }
          }
        }
      }
    }
  }
}
