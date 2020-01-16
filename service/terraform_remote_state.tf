data "terraform_remote_state" "aws_iam" {
  backend = "s3"

  config = {
    bucket = "terraform-tfstate-bucket-yoji4910"
    key    = "terraform_ecs/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-tfstate-bucket-yoji4910"
    key    = "terraform_ecs/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}