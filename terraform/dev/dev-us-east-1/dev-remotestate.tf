terraform {
  backend "s3" {
    bucket         = "forgotpw-tfstate-dev"
    region         = "us-east-1"
    profile        = "fpwdev-terraform"
    dynamodb_table = "tfstate_dev"
    key            = "rileyandbot-infrastructure-us-east-1/terraform.tfstate"
  }
}
