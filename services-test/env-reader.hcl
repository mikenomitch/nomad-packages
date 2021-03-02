job "env-reader" {
  datacenters = ["[[.datacenters]]"]
  type = "service"

  group "env-reader-group" {
    network {
      mode = "bridge"

      port "http" {
        static = 9002
        to     = 9002
      }

      port "https" {}
    }

    service {
      name = "env-reader"
      port = 9002

      connect {
        sidecar_service {}
      }
    }

    task "env-reader" {
      driver = "docker"

      config {
        image = "mnomitch/env-reader"
        ports = ["http", "https"]
      }

      env {
        PORT = "${NOMAD_PORT_http}"
        VAR_A = "This is a Variable"
        VAR_B = "This is also a Variable"
      }

      resources {
        memory = [[.memory]]
      }
    }
  }
}
