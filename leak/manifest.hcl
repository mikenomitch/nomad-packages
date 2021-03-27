nomad_resource "leak" {
  type = "job"
  description = "a simple memory leak to test memory limits"

  template_file = "leak.hcl"
  variable_file = "variables.hcl"
}
