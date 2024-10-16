output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
    lb = module.alb_sg.security_group.id
    api = module.api_sg.security_group.id
    db = module.db_sg.security_group.id
  }
}