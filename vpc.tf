locals {
  public_ip_cidr_offset = 10

  derived_private_subnet_cidr = [for i in range(length(var.azs)) : cidrsubnet(var.cidr, 8, i)]
  derived_public_subnet_cidr  = [for i in range(length(var.azs)) : cidrsubnet(var.cidr, 8, local.public_ip_cidr_offset + i)]
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = join("-", [var.name, var.environment])
  cidr = var.cidr

  azs = var.azs

  private_subnets = local.derived_private_subnet_cidr
  public_subnets  = local.derived_public_subnet_cidr

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Name        = var.name
    Environment = var.environment
    Workspace   = terraform.workspace
  }

}
