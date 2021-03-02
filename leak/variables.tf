variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "cpu" {
  description = "cpu used for the task"
  type        = "string"
  default     = "200"
}

variable "memory" {
  description = "memory used for the task"
  type        = "string"
  default     = "200"
}
