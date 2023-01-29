# Terraform AWS Module Template
A repository template for creating reusable terraform modules to support infrastructure as code capabilities for workloads running on AWS. 

# Overview

# Usage 

The example below demonstrates how this module can be used from a remote project repository. Please note, since this is a public repository, using SSH authentication mechanisms is not required. 

<pre><code>
module "alb" {
  source = "github.com/NCI-CTOS/terraform-aws-lb?ref=v1.0.0"

  app     = var.app
  env     = terraform.workspace
  program = var.program

  access_logs_enabled        = var.alb_access_logs_enabled
  access_logs_bucket         = var.alb_access_logs_bucket
  access_logs_prefix         = var.alb_access_logs_prefix
  desync_mitigation_mode     = var.alb_desync_mitigation_mode
  drop_invalid_header_fields = var.alb_drop_invalid_header_fields
  enable_deletion_protection = var.alb_enable_deletion_protection
  enable_http2               = var.alb_enable_http2
  idle_timeout               = var.alb_idle_timeout
  internal                   = local.alb_internal
  load_balancer_type         = var.alb_load_balancer_type
  preserve_host_header       = var.alb_preserve_host_header
  security_groups            = module.alb_sg.id
  subnets                    = local.alb_subnets
}
</code></pre>

<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

# Modules

No modules.

# Resources

| Name | Type |
|------|------|
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_bucket"></a> [access\_logs\_bucket](#input\_access\_logs\_bucket) | name of the destination bucket for load balancer access logs | `string` | `null` | no |
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | enables load balancer access logging | `bool` | `false` | no |
| <a name="input_access_logs_prefix"></a> [access\_logs\_prefix](#input\_access\_logs\_prefix) | directory prefix to store load balancer access logs within - default is root directory | `string` | `null` | no |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_desync_mitigation_mode"></a> [desync\_mitigation\_mode](#input\_desync\_mitigation\_mode) | how the load balancer handles requests that might pose a security risk to an application due to HTTP desync, either monitor, defensive, or strictest | `string` | `"strictest"` | no |
| <a name="input_drop_invalid_header_fields"></a> [drop\_invalid\_header\_fields](#input\_drop\_invalid\_header\_fields) | whether HTTP headers with header fields that are not valid are removed by the load balancer | `bool` | `true` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | (Network ELBs Only) If true, cross-zone load balancing of the load balancer will be enabled | `bool` | `false` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | prevents terraform from accidentally destroying the load balancer | `bool` | `true` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | whether HTTP/2 is enabled in application load balancers | `bool` | `true` | no |
| <a name="input_enable_waf_fail_open"></a> [enable\_waf\_fail\_open](#input\_enable\_waf\_fail\_open) | whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the requests to waf | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | in seconds, the amount of time the connection is permitted to be idle | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | n/a | `bool` | `false` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | defines load balancer type of either application, gateway, or network | `string` | `"application"` | no |
| <a name="input_preserve_host_header"></a> [preserve\_host\_header](#input\_preserve\_host\_header) | whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change | `bool` | `false` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | security group(s) to associate with the load balancer | `set(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | the subnets to associate with the load balancer | `set(string)` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | n/a |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_security_groups"></a> [security\_groups](#output\_security\_groups) | n/a |
<!-- END_TF_DOCS -->
