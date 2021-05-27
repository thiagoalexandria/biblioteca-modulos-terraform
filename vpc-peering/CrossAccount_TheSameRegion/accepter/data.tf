#Data source para identificar os dados da VPC da conta Accepter.
data "aws_vpc" "accepter" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

#Data source para identificar route tables da VPC da conta Accepter.
data "aws_route_tables" "accepter" {
  vpc_id        = data.aws_vpc.accepter.id
}


data "aws_caller_identity" "current" {}