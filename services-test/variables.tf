variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "memory" {
  description = "memory limit for the task"
  type        = "number"
  default     = 300

  meta {
    min = 200
    max = 900
  }
}

variable_set "first_page" {
  order = 1
  variables = [variable.datacenters, variable.memory]
}

variable_set "second_page" {
  order = 2
  variables = [variable.driver]
}
