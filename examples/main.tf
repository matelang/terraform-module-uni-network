provider "aws" {
  region = "eu-central-1"
}

module "network" {
  source = "../network"

  name        = var.name
  environment = "dev"
  cidr        = "10.0.0.0/16"
}

variable "name" {
  type = string
}
