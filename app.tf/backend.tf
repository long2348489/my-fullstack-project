terraform {
  backend "s3" {
    bucket = "tamtmbucket"
    key    = "github_ci/infra/provison.tfstate"
    region = "ap-southeast-2"
  }
}
