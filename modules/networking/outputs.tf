output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
    lb = module.alb_sg.security_group.id
    web = module.web_sg.security_group.id
    db = module.db_sg.security_group.id
  }
}