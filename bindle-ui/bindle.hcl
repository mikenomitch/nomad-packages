job "bindle-ui" {
  datacenters = ["[[.datacenters]]"]

  group "bindle-ui" {
    network {
      port "nomad" {
        to = "4646"
      }

      port "api" {
        static = "9000"
      }

      port "ui" {
        static = "4200"
      }
    }

    task "api" {
      driver = "docker"

      env {
        NOMAD_ADDR = "[[.nomad_address]]"
      }

      config {
        image = "mnomitch/bindle-api:latest"
        ports = ["api"]
      }

      resources {
        cpu    = 200
        memory = 1000
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

      resources {
        cpu    = 200
        memory = 1000
      }
    }
  }
}
