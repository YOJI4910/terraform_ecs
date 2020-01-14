# ECS-optimize AMIのidをネットから取得
data aws_ssm_parameter amzn2_ami {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "sample" {
  ami                         = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = "t2.small"
  monitoring                  = false
  iam_instance_profile        = data.terraform_remote_state.aws_iam.outputs.ecs_instance_profile_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnet_1_id
  user_data                   = file("./user_data.sh")
  associate_public_ip_address = true
  vpc_security_group_ids = [
    "${aws_security_group.instance.id}",
  ]

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
  }
}