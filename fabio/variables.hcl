variable "datacenters" {
  description = "the datacenters to run the job on"
  type        = "string"
  default     = "dc1"
}

variable "proxyPort" {
  description = "port through which you proxy"
  type        = "number"
  default     = 9999
}

variable "uiPort" {
  description = "port for fabio ui"
  type        = "number"
  default     = 9998
}
