locals {
  
  access_logs_bucket = var.access_logs_enabled ? var.access_logs_bucket : null
  access_logs_prefix = var.access_logs_enabled ? var.access_logs_prefix : null
  stack = "${var.program}-${var.env}-${var.app}"
}