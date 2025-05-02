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

output "subnet_arn" {
  value = aws_subnet.subnet.arn
}

output "subnet_id" {
  value = aws_subnet.subnet.id
}

output "subnet_cidr_block" {
  value = aws_subnet.subnet.cidr_block
}

output "subnet_availibility_zone" {
  value = aws_subnet.subnet.availability_zone
}
