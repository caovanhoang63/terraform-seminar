# output "db_password" {
#   value = module.database.config.password
#   sensitive = true
# }
#
# output "lb_dns_name" {
#   value = module.autoscaling.lb_dns
# }

output "s3_static_url" {
  value = module.static-store.s3_dns_name
}