nomad_resource "cephrbd-controller" {
  type = "job"
  description = "a demo job to run ceph controller"
  template_file = "cephrbd-controller.hcl"
}

nomad_resource "cephrbd-node" {
  type = "job"
  description = "a demo job to run ceph node"
  template_file = "cephrbd-node.hcl"
}
