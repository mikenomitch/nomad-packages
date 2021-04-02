variable "datacenters" {
  description = "the datacenters to run the job on"
  type        = "string"
  default     = "dc1"
}

variable "httpPort" {
  description = "port for standard http traffic"
  type        = "number"
  default     = 8080
}

variable "apiPort" {
  description = "port for the api to use"
  type        = "number"
  default     = 8081
}
