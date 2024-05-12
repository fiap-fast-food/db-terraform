terraform {
  backend "s3" {
    bucket = "fv-fiap-db"
    key    = "fiap-food-db-state.tfstate"
    region = "us-east-2"
  }
}