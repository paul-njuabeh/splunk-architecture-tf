terraform {
  backend "s3" {
    bucket = "splunkconf23"
    region = "us-west-2"
    key = "jenkins-ansible-servers/terraform.tfstate"
  }
}
