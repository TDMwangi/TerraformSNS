data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "sns_policy_document" {
  statement {
    effect = "Allow"
  }
}
