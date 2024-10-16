terraform {
  backend "s3" {}
}

provider "aws" {
  region = "ap-southeast-1"
  version = "< 5.71.0"
}

locals {
  project = "terraform-seminar"
}
data "aws_region" "current" {}

module "networking" {
  source = "./modules/networking"
  project          = local.project
  vpc_cidr         = "10.0.0.0/16"
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  database_subnets = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
}

module "database" {
  source = "./modules/database"

  project = local.project
  vpc     = module.networking.vpc
  sg      = module.networking.sg
}

module "autoscaling" {
  source = "./modules/autoscaling"
  project   = local.project
  vpc       = module.networking.vpc
  sg        = module.networking.sg
  db_config = module.database.config
}

module "static-store" {
  source = "./modules/static-store"
  project = local.project
}