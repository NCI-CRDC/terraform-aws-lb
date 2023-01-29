variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
  sensitive   = false

  validation {
    condition = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values for env are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "access_logs_enabled" {
  type        = bool
  description = "enables load balancer access logging"
  default     = false
}

variable "access_logs_bucket" {
  type        = string
  description = "name of the destination bucket for load balancer access logs"
  default     = null
}

variable "access_logs_prefix" {
  type        = string
  description = "directory prefix to store load balancer access logs within - default is root directory"
  default     = null
}

variable "desync_mitigation_mode" {
  type        = string
  description = "how the load balancer handles requests that might pose a security risk to an application due to HTTP desync, either monitor, defensive, or strictest"
  default     = "strictest"
}

variable "drop_invalid_header_fields" {
  type        = bool
  description = "whether HTTP headers with header fields that are not valid are removed by the load balancer"
  default     = true
}

variable "enable_cross_zone_load_balancing" {
  type        = bool
  description = "(Network ELBs Only) If true, cross-zone load balancing of the load balancer will be enabled"
  default     = false
}

variable "enable_deletion_protection" {
  type        = bool
  description = "prevents terraform from accidentally destroying the load balancer"
  default     = true
}

variable "enable_http2" {
  type        = bool
  description = "whether HTTP/2 is enabled in application load balancers"
  default     = true
}

variable "enable_waf_fail_open" {
  type        = bool
  description = "whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the requests to waf"
  default     = false
}

variable "idle_timeout" {
  type        = number
  description = "in seconds, the amount of time the connection is permitted to be idle"
  default     = 60
}

variable "internal" {
  type        = bool
  description = ""
  default     = false
}

variable "load_balancer_type" {
  type        = string
  description = "defines load balancer type of either application, gateway, or network"
  default     = "application"
}

variable "preserve_host_header" {
  type        = bool
  description = "whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change"
  default     = false
}

variable "security_groups" {
  type        = set(string)
  description = "security group(s) to associate with the load balancer"
}

variable "subnets" {
  type        = set(string)
  description = "the subnets to associate with the load balancer"
}

