nomad_resource "countdash" {
  type = "job"
  description = "Counts those dashes!"
  template_file = "countdash.nomad"
}
