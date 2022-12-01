variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

locals {
  cluster_name = "demo-eks-cluster"
}