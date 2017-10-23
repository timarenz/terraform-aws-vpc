# tf_aws_vpc
This Terraform module is used to create a simple AWS VPC with a public and private network using 192.168.0.0/16 as cidr block.
The public network uses 192.168.1.0/24 as subnet and automatically maps publich IP addresses to instaces.
The private network uses the subnet 192.168.2.0/24.

## Input variables
* `environment_name` - Used as prefix for all supported object names
* `owner_name` - Also used as prefix for all supported object names

Example: The name could be something like tim-staging-vpc, where tim is the owner_name, staging the environment_name and vpc the object. The object name is automatically appended.

## Output variables

* `vpc_id` - Id of the VPC created
* `private_subnet_id` - Id of the private subnet
* `public_subnet_id` - Id of the public subnet

## Example

module "vpc-aws" {
  source            = "github.com/timarenz/tf_aws_vpc"
  environment_name  = "staging"
  owner_name        = "tim"
}

## Authors
Created and maintaned by [Tim Arenz](https://github.com/timarenz)

## License
[MIT](LICENSE)