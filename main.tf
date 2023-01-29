resource "aws_lb" "this" {
  name     = "${local.stack}-alb"
  internal = var.internal

  desync_mitigation_mode           = var.desync_mitigation_mode
  drop_invalid_header_fields       = var.drop_invalid_header_fields
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  enable_waf_fail_open             = var.enable_waf_fail_open
  idle_timeout                     = var.idle_timeout
  load_balancer_type               = var.load_balancer_type
  preserve_host_header             = var.preserve_host_header
  security_groups                  = var.security_groups
  subnets                          = var.subnets

  access_logs {
    enabled = var.access_logs_enabled
    bucket  = var.access_logs_bucket
    prefix  = var.access_logs_prefix
  }
}
