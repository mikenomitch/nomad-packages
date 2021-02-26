job "leak" {
  datacenters = ["{{.Datacenters}}"]
  type = "batch"

  group "leak-group" {
    count = 1

    task "leak" {
      driver = "docker"

      restart {
        attempts = 10
        delay    = "1s"
      }

      config {
        image = "mnomitch/leak"
      }

      resources {
        cpu = {{.CPU}}
        memory = {{.Memory}}
      }
    }
  }
}
