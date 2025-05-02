// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

variable "assign_ipv6_address_on_creation" {
  type        = bool
  description = "(Optional) Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address."
  default     = false
}

variable "availability_zone" {
  type        = string
  description = "(Optional) AZ for the subnet."
  default     = null
}

variable "availability_zone_id" {
  type        = string
  description = "(Optional) AZ ID of the subnet. This argument is not supported in all regions or partitions. If necessary, use `availability_zone` instead."
  default     = null
}

variable "cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the subnet."
  default     = null
}

variable "customer_owned_ipv4_pool" {
  type        = string
  description = "(Optional) The customer owned IPv4 address pool. Typically used with the `map_customer_owned_ip_on_launch` argument. The `outpost_arn` argument must be specified when configured."
  default     = null
}

variable "enable_dns64" {
  type        = bool
  description = "(Optional) Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations."
  default     = false
}

variable "enable_lni_at_device_index" {
  type        = number
  description = "(Optional) Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations."
  default     = null
  validation {
    condition     = var.enable_lni_at_device_index == null || coalesce(var.enable_lni_at_device_index, 1) > 0
    error_message = "enable_lni_at_device_index must be greather than 0"
  }
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  type        = bool
  description = "(Optional) Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records."
  default     = false
}

variable "enable_resource_name_dns_a_record_on_launch" {
  type        = bool
  description = "(Optional) Indicates whether to respond to DNS queries for instance hostnames with DNS A records."
  default     = false
}

variable "ipv6_cidr_block" {
  type        = string
  description = "(Optional) The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length."
  default     = null
}

variable "ipv6_native" {
  type        = bool
  description = "(Optional) Indicates whether to create an IPv6-only subnet."
  default     = false
}

variable "map_customer_owned_ip_on_launch" {
  type        = bool
  description = "(Optional) Specify `true` to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The `customer_owned_ipv4_pool` and `outpost_arn` arguments must be specified when set to `true`."
  default     = null
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  default     = false
}

variable "outpost_arn" {
  type        = string
  description = "(Optional) The Amazon Resource Name (ARN) of the Outpost."
  default     = null
}

variable "private_dns_hostname_type_on_launch" {
  type        = string
  description = "(Optional) The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: `ip-name`, `resource-name`."
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "(Required) The VPC ID."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource."
  default     = {}
}
