variable "peering_connection_id" {
    type = string
    description = "Id disponibilizado pela origem do Peering"
}
variable "pcx_name" {
  type = string
  description = "Nome do Peering"
}
variable "owner_cird_block" {
    type = string
    description = "Bloco de rede da origem do Peering"
}
variable "vpc_name" {
  type = string
  description = "Nome da VPC para filtragem do data source"
}
variable "tags" {
  description = "Mapa (Map) de tags para os resources."
  default     = {}
  type        = map
}