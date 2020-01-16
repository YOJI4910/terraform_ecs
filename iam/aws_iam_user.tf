resource "aws_iam_user" "deploy-user" {
  name = "deploy-user"
}

resource "aws_iam_policy" "deploy" {
  name        = "deploy"
  path        = "/"
  description = "deploy policy"
  policy      = file("./aws_iam_policies/ecr_policy.json")
}

resource "aws_iam_user_policy_attachment" "deploy-attach" {
  user       = aws_iam_user.deploy-user.name
  policy_arn = aws_iam_policy.deploy.arn
}