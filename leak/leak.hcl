job "leak" {
  datacenters = ["{{}}"]
  type = "batch"

  group "leak-group" {
    count = 1

    task "leak" {
      driver = "docker"

      restart {
        attempts = 100
        delay    = "1s"
      }


      config {
        image = "mnomitch/leak"
        memory_hard_limit = 2000
      }

      resources {
        memory = 200
        memory_hard_limit = -1
      }
    }
  }
}
