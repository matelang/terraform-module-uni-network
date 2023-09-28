variable "name" {
  type = string
  description = "a projekt neve"
}

variable "environment" {
  type = string
  description = "a kornyezet neve"
}

variable "cidr" {
  type = string
  description = "ip range"
}

variable "azs" {
  type = list(string)
  default = ["euc1-az1", "euc1-az2", "euc1-az3"]
  description = "availability zoneok listaja"
}
