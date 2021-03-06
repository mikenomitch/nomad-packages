job "webapp" {
  datacenters = ["[[.datacenters]]"]

  group "demo" {
    count = 2

    network {
      port "webapp_http" {}
      port "toxiproxy_webapp" {}
    }

    task "webapp" {
      driver = "docker"

      config {
        image = "hashicorp/demo-webapp-lb-guide"
        ports = ["webapp_http"]
      }

      env {
        PORT    = "${NOMAD_PORT_webapp_http}"
        NODE_IP = "${NOMAD_IP_webapp_http}"
      }

      resources {
        cpu    = 100
        memory = 100
      }

      scaling "mem" {
        enabled = true
        min = 20
        max = 60

        policy {
          evaluation_interval = "10s"
          cooldown = "0m"

          check "95pct" {
            strategy "app-sizing-percentile" {
              percentile = "95"
            }
          }
        }
      }

      scaling "cpu" {
        enabled = true
        min = 40
        max = 200

        policy {
          evaluation_interval = "10s"
          cooldown = "0m"

          check "95pct" {
            strategy "app-sizing-percentile" {
              percentile = "95"
            }
          }
        }
      }
    }

    task "toxiproxy" {
      driver = "docker"

      lifecycle {
        hook    = "prestart"
        sidecar = true
      }

      config {
        image      = "shopify/toxiproxy:2.1.4"
        entrypoint = ["/entrypoint.sh"]
        ports      = ["toxiproxy_webapp"]

        volumes = [
          "local/entrypoint.sh:/entrypoint.sh",
        ]
      }

      template {
        data = <<EOH
#!/bin/sh
set -ex
/go/bin/toxiproxy -host 0.0.0.0  &
while ! wget --spider -q http://localhost:8474/version; do
  echo "toxiproxy not ready yet"
  sleep 0.2
done
/go/bin/toxiproxy-cli create webapp -l 0.0.0.0:${NOMAD_PORT_toxiproxy_webapp} -u ${NOMAD_ADDR_webapp_http}
/go/bin/toxiproxy-cli toxic add -n latency -t latency -a latency=1000 -a jitter=500 webapp
tail -f /dev/null
        EOH

        destination = "local/entrypoint.sh"
        perms       = "755"
      }

      resources {
        cpu    = 100
        memory = 32
      }

      service {
        name = "webapp"
        port = "toxiproxy_webapp"

        check {
          type           = "http"
          path           = "/"
          interval       = "5s"
          timeout        = "3s"
          initial_status = "passing"
        }
      }
    }
  }
}
