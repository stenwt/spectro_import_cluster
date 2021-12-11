
# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create a key pair, Spectro Cloud Palette requires an existing key pair that will be injected into the ec2 instances it creates
resource "aws_key_pair" "spectro_cloud_key" {
  key_name   = "spectro-key"
  public_key = var.aws_key_pair
}