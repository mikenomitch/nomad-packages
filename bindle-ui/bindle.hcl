job "bindle-ui" {
  datacenters = ["[[.datacenters]]"]

  group "bindle-ui" {
    network {
      port "ui" {
        static = "9000"
      }
      port "api" {
        static = "4200"
      }
    }

    task "api" {
      driver = "docker"

      config {
        image = "mikenomitch/bindle-api:latest"
        ports = ["api"]
      }
    }

    task "ui" {
      driver = "docker"

      env {
        NOMAD_ADDR = "[[.nomad_address]]"
      }

      config {
        image = "mikenomitch/bindle-ui:latest"
        ports = ["ui"]
      }
    }
  }
}
