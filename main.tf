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

resource "aws_subnet" "subnet" {
  assign_ipv6_address_on_creation                = var.assign_ipv6_address_on_creation
  availability_zone                              = var.availability_zone
  availability_zone_id                           = var.availability_zone_id
  cidr_block                                     = var.cidr_block
  customer_owned_ipv4_pool                       = var.customer_owned_ipv4_pool
  enable_dns64                                   = var.enable_dns64
  enable_lni_at_device_index                     = var.enable_lni_at_device_index
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch    = var.enable_resource_name_dns_a_record_on_launch
  ipv6_cidr_block                                = var.ipv6_cidr_block
  ipv6_native                                    = var.ipv6_native
  map_customer_owned_ip_on_launch                = var.map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = var.map_public_ip_on_launch
  outpost_arn                                    = var.outpost_arn
  private_dns_hostname_type_on_launch            = var.private_dns_hostname_type_on_launch
  vpc_id                                         = var.vpc_id
  tags                                           = var.tags
}
