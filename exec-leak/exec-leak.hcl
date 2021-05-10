job "exec-leak" {
  datacenters = ["[[.datacenters]]"]
  type = "service"

  group "exec-leak-group" {
    count = 1

    task "exec-leak" {
      driver = "exec"

      restart {
        attempts = 10
        delay    = "1s"
      }

      config {
        command = "exec-leak"
      }


      artifact {
        source = "https://mikenomitch-public.s3.amazonaws.com/exec-leak"
      }


      resources {
        cpu = [[.cpu]]
        memory = [[.memory]]
        memory_max = [[.memoryMax]]
      }
    }
  }
}
