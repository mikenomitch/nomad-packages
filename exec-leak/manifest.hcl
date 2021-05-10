nomad_resource "exec-leak" {
  type = "job"
  description = "a simple memory leak to test memory limits run using exec"

  template_file = "exec-leak.hcl"
  variable_file = "variables.hcl"
}
