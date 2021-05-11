nomad_resource "remote-task-ecs" {
  type = "job"
  description = "A simple remote task - Must have ECS driver installed. see deps folder"

  template_file = "remote-job.hcl"
  variable_file = "variables.hcl"
}
