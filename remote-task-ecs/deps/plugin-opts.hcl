plugin "nomad-driver-ecs" {
  config {
    enabled = true

    #  AWS ECS Cluster to run tasks in
    cluster = "nomad-remote-driver-cluster"

    # AWS ECS Region to run tasks in
    region  = "us-east-1"
  }
}
