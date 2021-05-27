data "aws_ssm_parameter" "eks_ami" {
  name = "/aws/service/eks/optimized-ami/${var.kubernetes_version}/amazon-linux-2/recommended/image_id"
}

resource "aws_launch_template" "eks_launch_template" {
  image_id               = data.aws_ssm_parameter.eks_ami.value
  instance_type          = var.instance_type
  name                   = "eks_launch_template-${var.cluster_name}"
  update_default_version = true
  
  vpc_security_group_ids = tolist([var.sg, var.cluster_security_group])

  user_data = base64encode(templatefile("${path.module}/userdata.tpl", { CLUSTER_NAME = var.cluster_name, B64_CLUSTER_CA = var.cluster_certificate, API_SERVER_URL = var.cluster_endpoint }))
}