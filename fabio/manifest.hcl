nomad_resource "fabio" {
  type = "job"
  description = "Load balance some applications running on Nomad"
  template_file = "fabio.hcl"
}
