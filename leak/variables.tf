variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
}

variable "cpu" {
  description = "cpu used for the task"
  type        = "number"
  default     = 200
}

variable "memory" {
  description = "memory used for the task"
  type        = "number"
  default     = 200
}
