nomad_resource "countdash" {
  type = "job"
  description = "counts those dashes"

  template_file = "countdash.nomad"
  variable_file = "variables.tf"
}
