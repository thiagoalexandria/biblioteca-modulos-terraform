output "accepter_vpc_id" {
    value = data.aws_vpc.accepter.id
}

output "accepter_cidr_block" {
    value = data.aws_vpc.accepter.cidr_block
}

output "account_id" {
    value = data.aws_caller_identity.current.user_id
}