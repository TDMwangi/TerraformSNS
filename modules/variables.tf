variable "name" {
  description = "The name of the SNS topic"
  type        = string
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed CMK for Amazon SNS or a custom CMK"
  type        = string
}
