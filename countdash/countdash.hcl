job "countdash" {
  datacenters = ["[[.datacenters]]"]

  group "api" {
    task "web" {
      driver = "docker"
      config {
        image = "hashicorpnomad/counter-api:v1"
      }
      resources {
        network {
          port "count_api" {
            static = [[.count_api_port]]
          }
        }
      }
    }
    task "dashboard" {
      driver = "docker"
      env {
        COUNTING_SERVICE_URL = "http://127.0.0.1:[[.count_api_port]]"
      }
      config {
        image = "hashicorpnomad/counter-dashboard:v1"
      }
      resources {
        network {
          port "dashboard" {
            static = [[.dashboard_port]]
          }
        }
      }
    }
  }
}
