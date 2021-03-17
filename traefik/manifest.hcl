nomad_resource "lb" {
  type = "job"
  description = "a load balancer"

  template_file = "lb.hcl"
  variable_file = "variables.tf"
}

nomad_resource "webapp" {
  type = "job"
  description = "a sample webapp"

  template_file = "webapp.hcl"
  variable_file = "variables.tf"
}
