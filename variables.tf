## Launch Template
variable "domain_name" {
  description = "Name of the domain"
}

variable "access_policies" {
  description = "IAM policy document specifying the access policies for the domain"
  default     = null
}

variable "advanced_options" {
  description = "Key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your Elasticsearch domain on every apply."
  type        = map(string)
  default     = {}
}

variable "advanced_security_options" {
  description = "(Optional) Options for fine-grained access control."
  type        = any
  default     = {}
}

variable "ebs_options" {
  description = "(Optional) EBS related options, may be required based on chosen instance size."
  type        = any
  default     = {}
}


variable "encrypt_at_rest" {
  description = "(Optional) Encrypt at rest options. Only available for certain instance types."
  type        = any
  default     = {}
}


variable "node_to_node_encryption" {
  description = "(Optional) Node-to-node encryption options."
  type        = any
  default     = {}
}


variable "cluster_config" {
  description = "(Optional) Cluster configuration of the domain."
  type        = any
  default     = {}
}


variable "snapshot_options" {
  description = "(Optional) Snapshot related options."
  type        = any
  default     = {}
}


variable "vpc_options" {
  description = "VPC related options, see below. Adding or removing this configuration forces a new resource."
  type        = any
  default     = {}
}


variable "log_publishing_options" {
  description = "(Optional) Options for publishing slow logs to CloudWatch Logs."
  type        = any
  default     = {}
}


variable "elasticsearch_version" {
  description = "(Optional) Options for fine-grained access control. See below for more details."
  type        = string
  default     = "1.5"
}

variable "domain_endpoint_options" {
  description = "(Optional) Domain endpoint HTTP(S) related options"
  type        = any
  default     = {}
}

variable "tags" {
  description = "(optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}