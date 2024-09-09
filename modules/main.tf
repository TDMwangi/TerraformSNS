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

resource "aws_sns_topic" "accout_activity_topic" {
  name              = var.name
  kms_master_key_id = var.kms_master_key_id

  # The delivery policy settings are primarily focused on the handling of HTTP/S endpoints
  delivery_policy = <<EOF
  {
    "http": {
      "defaultHealthyRetryPolicy": {
        "minDelayTarget": 20,
        "maxDelayTarget": 50,
        "numRetries": 10,
        "numNoDelayRetries": 0,
        "numMinDelayRetries": 2,
        "numMaxDelayRetries": 5,
        "backoffFunction": "exponential"
      },
      "disableSubscriptionOverrides": false,
      "defaultThrottlePolicy": {
        "maxReceivesPerSecond": 1
      },
      "defaultRequestPolicy": {
        "headerContentType": "text/plain; charset=UTF-8"
      }
    }
  }
  EOF
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn    = resource.aws_sns_topic.accout_activity_topic.arn
  policy = data.aws_iam_policy_document.sns_policy_document.json
}
