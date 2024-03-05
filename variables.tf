variable "aws_access_key" {
  type        = string
  description = "(Required) AWS Access Key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "(Required) AWS Secret AKey"
  sensitive   = true
}

variable "aws_region" {
  type        = string
  description = "(Optional) AWS region to use for resources"
  default     = "ap-southeast-2"
}

variable "username" {
  type        = string
  description = "(Required) SSH username for SFTP"
  default     = "ryan"
}

variable "ssh_public_key" {
  type        = string
  description = "(Required) SSH public key for SFTP"
}
