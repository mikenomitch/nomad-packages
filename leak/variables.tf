variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "cpu" {
  description = "cpu used for the task"
  type        = "number"
  default     = 200

  meta {
    min = 100
    max = 300
  }
}

variable "memory" {
  description = "memory used for the task"
  type        = "number"
  default     = 200

  meta {
    min = 200
    max = 1000
  }
}

variable_set "initial" {
  contents = ["datacenters"]
}

variable_set "secondary" {
  contents = ["cpu", "memory"]
}
