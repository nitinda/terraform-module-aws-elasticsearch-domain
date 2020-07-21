## Launch Template
variable "domain_name" {
  description = "Name of the domain"
}

variable "access_policies" {
  description = "IAM policy document specifying the access policies for the domain"
  default     = null
}