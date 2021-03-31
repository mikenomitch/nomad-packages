job "bindle-ui" {
  datacenters = ["[[.datacenters]]"]

  group "bindle-ui" {
    network {
      port "api" {
        static = "9000"
      }
      port "ui" {
        static = "4200"
      }
    }

    task "api" {
      driver = "docker"

      config {
        image = "mnomitch/bindle-api:latest"
        ports = ["api"]
      }
    }

    task "ui" {
      driver = "docker"

      env {
        NOMAD_ADDR = "[[.nomad_address]]"
      }

      config {
        image = "mnomitch/bindle-ui:latest"
        ports = ["ui"]
      }
    }
  }
}
