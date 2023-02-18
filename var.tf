# access keys

variable "region" {
  description = "Chosen region for deployment"
  type = string
  sensitive = true
}

variable "access_key" {
  description = "General access key for AWS account."
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "General secret key for AWS account."
  type        = string
  sensitive   = true
}

#customer site resources

variable "public_ip" {
    description = "Public IP"
    type = string
    sensitive = true
}

#Tags

variable "env_prefix" {
  description = "Environment Prefix"
  type        = string
  sensitive   = true
}

variable "proj_prefix" {
  description = "Project Prefix"
  type        = string
  sensitive   = true
}

variable "team" {
  description = "Team"
  type        = string
  sensitive   = true
}