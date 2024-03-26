terraform {
  backend "s3" {
    bucket         = "terraform-backend-2024-v3"
    key            = "jenkins/terraform.tfstate"
    region         = "us-east-1"
  }
}