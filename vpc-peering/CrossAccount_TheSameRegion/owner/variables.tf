variable  "accepter_cidr_block" {
    type = string
    description = "Bloco de ID do accepter para liberaçao"
}
variable "vpc_name" {
    type = string
    description = "Nome da VPC para filtragem no datasource"
}
variable "accepter_vpc_id" {
    type = string
    description = "ID da VPC de destino para fechar comunicacao do Peering"
}

variable "accepter_id" {
    type = string
    description = "ID da conta aws que ta em "
}

variable "pcx_name" {
    description = "Nome do Peering connection."
    type        = string
}

variable "tags" {
  description = "Mapa (Map) de tags para os resources."
  default     = {}
  type        = map
}
