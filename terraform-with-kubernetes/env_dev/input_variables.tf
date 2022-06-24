variable "aws_main_region" {
  default = "us-east-2"
}

variable "project_name" {
  description = "Default project name"
  default     = "test"
}

variable "env_name" {
  description = "Environment"
  default     = "dev"
}

variable "cluster_version" {
  description = "EKS Cluster version"
  default     = "1.22"
}

variable "instance_type" {
  description = "Instance type"
  default     = "c5.xlarge"
}

variable "instance_capacity_type" {
  description = "Capacity type for cluster nodes."
  default     = "SPOT"
}