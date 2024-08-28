provider "aws" {
  access_key = ""
  secret_key = ""
  region     = ""
}

module "sns" {
  source = "./modules"
}
