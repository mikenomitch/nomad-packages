nomad_resource "autoscaler" {
  type = "job"
  description = "the autoscaler job"

  template_file = "autoscaler.hcl"
  variable_file = "variables.hcl"
}

nomad_resource "grafana" {
  type = "job"
  description = "show me some graphs"

  template_file = "grafana.hcl"
  variable_file = "variables.hcl"
}

nomad_resource "loki" {
  type = "job"
  description = "trick some norsemen"

  template_file = "loki.hcl"
  variable_file = "variables.hcl"
}

nomad_resource "prometheus" {
  type = "job"
  description = "make some fire"

  template_file = "prometheus.hcl"
  variable_file = "variables.hcl"
}

nomad_resource "webapp" {
  type = "job"
  description = "scale me!"

  template_file = "webapp.hcl"
  variable_file = "variables.hcl"
}
