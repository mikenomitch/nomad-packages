job "curler" {
  datacenters = ["{{.datacenters}}"]
  type = "service"

  group "curler-group" {
    count = 1

    network {
      mode = "bridge"

      port "http" {
        static = 9001
        to     = 9001
      }

      port "https" {}
    }

    service {
      name = "curler"
      port = 9001

      connect {
         sidecar_service {
           proxy {
             upstreams {
                destination_name = "env-reader"
                local_bind_port  = 9002
              }
           }
         }
       }
    }

    task "curler" {
      driver = "docker"

      config {
        image = "mnomitch/curler"
        ports = ["http", "https"]
      }

      env {
        PORT = "${NOMAD_PORT_http}"
        CURL_ADDR = "http://${NOMAD_UPSTREAM_ADDR_env_reader}"
      }

      resources {
        memory = 400
      }
    }
  }
}
