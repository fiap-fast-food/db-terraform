variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
}

variable "vpc_azs" {
  description = "Zonas de disponibilidade para a VPC"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "Subnets privadas para a VPC"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "Subnets públicas para a VPC"
  type        = list(string)
}

variable "vpc_tags" {
  description = "Tags adicionais para a VPC"
  type        = map(string)
}