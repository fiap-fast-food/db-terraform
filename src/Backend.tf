terraform {
  backend "s3" {
    bucket = "fv-fiap-food"
    key    = "fiap-food-state.tfstate"
    region = "us-east-2"
  }
}