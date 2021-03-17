variable "datacenters" {
  description = "the datacenters used for the jobs"
  type        = "string"
  default     = "dc1"
}

variable "minScale" {
  description = "lowest number to scale to"
  type        = "number"
  default     = 1
}
variable "maxScale" {
  description = "highest numbet to scale to"
  type        = "number"
  default     = 20
}
