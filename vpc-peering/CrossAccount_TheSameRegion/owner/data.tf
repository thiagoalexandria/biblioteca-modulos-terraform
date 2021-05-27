#Data source para identificar os dados da VPC da conta Owner.
data "aws_vpc" "owner" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}


#Data source para identificar route tables da VPC da conta Owner.
data "aws_route_tables" "owner" {
  vpc_id        = data.aws_vpc.owner.id
}