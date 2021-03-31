variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "nomad_address" {
  description = "the url for nomad"
  type        = "string"
  default     = "http://127.0.0.1:4646"
}
