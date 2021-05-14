variable "datacenters" {
  description = "the datacenters to run the job on"
  type        = "string"
  default     = "dc1"
}

variable "pluginId" {
  description = "ID of the plugin. Must match the value in the volume."
  type        = "string"
  default     = "aws-ebs"
}
