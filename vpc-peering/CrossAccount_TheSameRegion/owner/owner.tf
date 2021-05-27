#Criação do peering a partir da conta Owner
resource "aws_vpc_peering_connection" "owner" {
  vpc_id        = data.aws_vpc.owner.id
  peer_vpc_id   = var.accepter_vpc_id
  peer_owner_id = var.accepter_id

  tags          = merge(var.tags, map("Name", format("%s", var.pcx_name)))   #Merge das Tgas e definição do nome do Peering.
}
#Adicionando as rotas do peering nas route tables da Account Owner
resource "aws_route" "owner" {
  count                     = length(data.aws_route_tables.owner.ids)
  route_table_id            = tolist(data.aws_route_tables.owner.ids)[count.index]
  destination_cidr_block    = var.accepter_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id

  depends_on                = [data.aws_vpc.owner]

  timeouts {
    create = "5m"
    delete = "20m"
  }
}   