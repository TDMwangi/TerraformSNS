provider "aws" {
  access_key = ""
  secret_key = ""
  region     = ""
}

module "sns" {
  source = "./modules"

  name              = "cloud-custodian-topic"
  kms_master_key_id = "alias/aws/sns"
}
