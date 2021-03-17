job "demo-webapp" {
  datacenters = ["[[.datacenters]]"]

  group "demo" {
    count = [[.webAppCount]]

    task "server" {
      env {
        PORT    = "${NOMAD_PORT_http}"
        NODE_IP = "${NOMAD_IP_http}"
      }

      driver = "docker"

      config {
        image = "hashicorp/demo-webapp-lb-guide"
      }

      resources {
        network {
          mbits = 10
          port  "http"{}
        }
      }

      service {
        name = "demo-webapp"
        port = "http"

        tags = [
          "traefik.enable=true",
          "traefik.http.routers.http.rule=Path(`/myapp`)",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }
  }
}