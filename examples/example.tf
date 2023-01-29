module "alb" {
  source = "github.com/NCI-CTOS/terraform-aws-lb?ref=v1.0.0"

  app     = "mtp"
  env     = terraform.workspace
  program = "ccdi"

  access_logs_enabled        = true
  access_logs_bucket         = "my-example-log-bucket"
  access_logs_prefix         = null
  desync_mitigation_mode     = "strictest"
  drop_invalid_header_fields = true
  enable_deletion_protection = false # var.alb_enable_deletion_protection
  enable_http2               = true
  idle_timeout               = 60
  internal                   = false
  load_balancer_type         = "application"
  preserve_host_header       = false
  security_groups            = [ "sg-123456789" ]
  subnets                    = [ "subnet-A12345", "subnet-B12345" ]
}
