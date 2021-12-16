terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.69.0"

    }

  }
}
provider "aws" {
  #  profile="albina"
  region = var.region
  default_tags {
    tags = {     
          ProjectName=var.project_name
          Owner=var.owner
    }
  }
}

























