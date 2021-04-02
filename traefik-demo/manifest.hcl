nomad_resource "app" {
  type = "job"
  description = "A simple app"
  template_file = "webapp.hcl"
}

nomad_resource "lb" {
  type = "job"
  description = "A load balancer to balance said app"
  template_file = "lb.hcl"
}
