nomad_resource "env-reader" {
  type = "job"
  description = "env reader description"

  template_file = "env-reader.hcl"
  variable_file = "env-reader_variables.hcl"
}

nomad_resource "curler" {
  type = "job"
  description = "curler description"

  template_file = "curler.hcl"
  variable_file = "curler_variables.hcl"
}
