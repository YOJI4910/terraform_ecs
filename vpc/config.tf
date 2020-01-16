terraform {
  backend "s3" {
    bucket = "terraform-tfstate-bucket-yoji4910"
    key    = "terraform_ecs/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
