variable "image" {
  description = "identifier for the docker image"
  type        = string
}

variable "datacenters" {
  description = "the datacenters used for the job"
  type    = list(string)
  default = ["dc1"]

  meta {
    options = ["dc1", "dc2", "us-east-1"]
  }
}

variable "memory" {
  description = "memory limit for the task"
  type        = number
  default     = 300

  meta {
    min = 200
    max = 900
  }
}

variable "config_stanza" {
  description = "specify the stanza for the docker configuration"
  type        = string

  meta {
    input_type = "hcl"
  }
}

variable "cpu" {
  description = "soft mhx limit for the task"
  type        = number
  default     = 200

  meta {
    min = 100
    max = 400
  }
}

variable_set "basics" {
  order = 1
  variables = [variable.datacenters, variable.image]
}

variable_set "resources" {
  order = 2
  variables = [variable.memory, variable.cpu]
}

