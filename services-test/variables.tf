variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "memory" {
  description = "memory used for the task"
  type        = "string"
  default     = "999"
}

variable_page "first_page" {
  order = 1
  variables = [variable.datacenters, variable.memory]
}

variable_page "second_page" {
  order = 2
  variables = [variable.driver]
}
