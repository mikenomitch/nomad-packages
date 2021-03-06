job "autoscaler" {
  type = "service"

  datacenters = ["[[.datacenters]]"]

  group "autoscaler" {
    count = 1

    network {
      port "http" {}
      port "promtail" {}
    }

    task "autoscaler" {
      driver = "docker"

      config {
        image   = "hashicorp/nomad-autoscaler-enterprise:0.3.3"
        command = "nomad-autoscaler"
        ports   = ["http"]

        args = [
          "agent",
          "-config",
          "${NOMAD_TASK_DIR}/config.hcl",
          "-http-bind-address",
          "0.0.0.0",
          "-http-bind-port",
          "${NOMAD_PORT_http}",
        ]
      }

      template {
        data = <<EOF
nomad {
  address = "{{ with service "nomad-client" }}{{ with index . 0 }}http://{{.Address}}:{{.Port}}{{ end }}{{ end }}"
  namespace = "*"
  // If Nomad ALCs are not being used, comment this line out
  token = "{{key "service/autoscaler/acl"}}"
}
telemetry {
  prometheus_metrics = true
  disable_hostname   = true
}
apm "prometheus" {
  driver = "prometheus"
  config = {
    address = "{{ with service "prometheus" }}{{ with index . 0 }}http://{{.Address}}:{{.Port}}{{ end }}{{ end }}"
  }
}
strategy "target-value" {
  driver = "target-value"
}
dynamic_application_sizing {
  evaluate_after            = "0m"
  metrics_preload_threshold = "10m"
}
policy_eval {
  // Disable the horizontal application and horizontal cluster workers. This
  // helps reduce log noise during the demo.
  workers = {
    cluster    = 0
    horizontal = 0
  }
}
policy {
  default_evaluation_interval = "1s"
  default_cooldown = "10s"
}

          EOF

        destination = "${NOMAD_TASK_DIR}/config.hcl"
      }

      resources {
        cpu    = 50
        memory = 128
      }

      service {
        name = "autoscaler"
        port = "http"

        check {
          type     = "http"
          path     = "/v1/health"
          interval = "3s"
          timeout  = "1s"
        }
      }
    }

    task "promtail" {
      driver = "docker"

      lifecycle {
        hook    = "prestart"
        sidecar = true
      }

      config {
        image = "grafana/promtail:1.5.0"
        ports = ["promtail"]

        args = [
          "-config.file",
          "local/promtail.yaml",
        ]
      }

      template {
        data = <<EOH
server:
  http_listen_port: {{ env "NOMAD_PORT_promtail" }}
  grpc_listen_port: 0
positions:
  filename: /tmp/positions.yaml
client:
  url: http://{{ range $i, $s := service "loki" }}{{ if eq $i 0 }}{{.Address}}:{{.Port}}{{end}}{{end}}/api/prom/push
scrape_configs:
- job_name: system
  entry_parser: raw
  static_configs:
  - targets:
      - localhost
    labels:
      task: autoscaler
      __path__: /alloc/logs/autoscaler*
  pipeline_stages:
  - match:
      selector: '{task="autoscaler"}'
      stages:
      - regex:
          expression: '.*policy_id=(?P<policy_id>[a-zA-Z0-9_-]+).*source=(?P<source>[a-zA-Z0-9_-]+).*strategy=(?P<strategy>[a-zA-Z0-9_-]+).*target=(?P<target>[a-zA-Z0-9_-]+).*Group:(?P<group>[a-zA-Z0-9]+).*Job:(?P<job>[a-zA-Z0-9_-]+).*Namespace:(?P<namespace>[a-zA-Z0-9_-]+)'
      - labels:
          policy_id:
          source:
          strategy:
          target:
          group:
          job:
          namespace:
EOH

        destination = "local/promtail.yaml"
      }

      resources {
        cpu    = 50
        memory = 32
      }

      service {
        name = "promtail"
        port = "promtail"

        check {
          type     = "http"
          path     = "/ready"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
