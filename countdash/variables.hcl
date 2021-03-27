variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"

  meta = {
    options = ["dc1", "dc2"]
  }
}

variable "count_api_port" {
  description = "port used for the counting api task"
  type        = "number"
  default     = 9001

  meta = {
    min = 9000
    max = 9999
  }
}

variable "dashboard_port" {
  description = "port used for the dashboard task"
  type        = "number"
  default     = 9002

  meta = {
    min = 9000
    max = 9999
  }
}
