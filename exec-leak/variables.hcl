variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "count" {
  description = "count of tasks"
  type        = "number"
  default     = 1
}

variable "cpu" {
  description = "cpu used for the task"
  type        = "number"
  default     = 220
}

variable "memory" {
  description = "memory reserved on the client for the task"
  type        = "number"
  default     = 200
}

variable "memoryMax" {
  description = "hard memory limit for the task"
  type        = "number"
  default     = 300
}
