nomad_resource "ebs-controller" {
  type = "job"
  description = "CSI controller for EBS"
  template_file = "plugin-ebs-controller.hcl"
}

nomad_resource "ebs-node" {
  type = "job"
  description = "CSI nodes for EBS"
  template_file = "plugin-ebs-nodes.hcl"
}

// TODO: Add an example job using the volume

// nomad_resource "volume-consumer" {
//   type = "job"
//   description = "An example job consuming the volume"
//   template_file = "volume-consumer.hcl"
// }
