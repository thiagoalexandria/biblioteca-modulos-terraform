resource "aws_security_group_rule" "cluster_ingress_vpn" {
    cidr_blocks = ["10.80.0.0/24"]
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    description = "VPN-TELECOM"
    security_group_id = aws_eks_cluster.eks_cluster.vpc_config.0.cluster_security_group_id
    type = "ingress"
}

resource "aws_security_group_rule" "cluster_ingress_https" {
    cidr_blocks = ["10.82.1.105/32"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "Gitlab Runner"
    security_group_id = aws_eks_cluster.eks_cluster.vpc_config.0.cluster_security_group_id
    type = "ingress"
}