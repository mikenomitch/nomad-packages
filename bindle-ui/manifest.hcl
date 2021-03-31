nomad_resource "bindle" {
  type = "job"
  description = "Renders UI for configuring and deploying nomad packages."
  template_file = "bindle.hcl"
}