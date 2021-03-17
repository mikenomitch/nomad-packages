variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "webAppCount" {
  description = "number of webapps to balance over"
  type        = "number"
  default     = 3

  meta = {
    min = 1
    max = 5
  }
}
