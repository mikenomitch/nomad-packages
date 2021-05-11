variable "datacenters" {
  description = "the datacenters used for the job"
  type        = "string"
  default     = "dc1"
}

variable "launchType" {
  description = "ECS launch type"
  type        = "string"
  default     = "FARGATE"
}

variable "taskDefinition" {
  description = "task definition used by ECS"
  type        = "string"
  default     = "nomad-remote-driver-demo:1"
}

variable "securityGroup" {
  description = "a security group to use - bring your own"
  type        = "string"
  default     = "sg-1337"
}

variable "subNetIt" {
  description = "subnet ID to use - bring your own"
  type        = "string"
  default     = "subnet-1337"
}