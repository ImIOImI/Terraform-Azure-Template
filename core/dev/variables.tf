variable "service_name" {
  description = "Prefix to add to naming convention"
  default     = ""
}

variable "prefix" {
  description = "Default prefix for resource names"
}

variable "env" {
  description = "Environment or Subscription Type that the vnet will be deployed too"
  default     = "dev"
}

variable "location" {
  description = "The Azure location where the Vnet will be created"
}

variable "instance" {
  description = "Instance count if more than one is needed"
  default     = "001"
}

variable "vnet_cidr_block" {
  description = "Cidr block for the Vnet"
}
variable "gateway_subnet_cidr" {
  description = "Cidr block for the gateway subnet"
  default     = "10.1.0.0/28"
}