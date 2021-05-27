output "owner_cird_block" {
    value = data.aws_vpc.owner.cidr_block
}

output "peering_connection_id" {
    value = aws_vpc_peering_connection.owner.id
}