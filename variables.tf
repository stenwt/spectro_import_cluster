
#Cloud Account
#Variables used to create or reference a cloud account in Palette
variable "cluster_cloud_account_name" {}
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {
  sensitive    = true
}
variable "aws_key_pair" {
  description  = "your ssh public key"
}

#Cluster Profile
variable "cluster_profile_name" {}
variable "cluster_profile_description" {}
variable "cluster_profile_tags" {}
variable "cloud" {}
variable "type" {}

# Cluster
variable "cluster_name" {}
variable "master_instance_type" {
  default = "t3a.large"  
}
variable "worker_instance_type" {
  default = "t3a.xlarge"  
}
variable "aws_region" {}
variable "master_aws_region_az" {}
variable "worker_aws_region_az" {}
variable "master-pool_node_count" {
  default = "1"
}
variable "worker-pool_node_count" {
  default = "1"
}
variable "aws_ssh_key_name" {
  description  = "name of your key pair for the AWS region you are operating in"
}
