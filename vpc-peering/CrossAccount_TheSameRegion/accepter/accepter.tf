#Resource para aceitar a conexão do peering na Account Accepter
resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id = var.peering_connection_id
  auto_accept               = true

  tags          = merge(var.tags, map("Name", format("%s", var.pcx_name)))   #Merge das Tgas e definição do nome do Peering.
}

#Adicionando as rotas do peering nas route tables da Account Accepter
resource "aws_route" "accepter" {
  count                     = length(data.aws_route_tables.accepter.ids)
  route_table_id            = tolist(data.aws_route_tables.accepter.ids)[count.index]
  destination_cidr_block    = var.owner_cird_block
  vpc_peering_connection_id = var.peering_connection_id

  depends_on                = [data.aws_vpc.accepter]

  timeouts {
    create = "5m"
    delete = "20m"
  }
}  
