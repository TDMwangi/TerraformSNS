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

    actions   = ["SNS:Publish", "SNS:Subscribe"]
    resources = ["arn:aws:sns:eu-west-1:${data.aws_caller_identity.current.account_id}:${aws_sns_topic.accout_activity_topic.name}"]
  }
}
