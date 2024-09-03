data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "sns_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type = "AWS"
      identifiers = [
        data.aws_caller_identity.current.arn
      ]
    }
  }
}
