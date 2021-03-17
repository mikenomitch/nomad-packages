nomad_resource "countdash" {
  type = "job"
  description = "counts those dashes"

  template_file = "countdash.hcl"
  variable_file = "variables.tf"
}
