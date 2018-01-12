# Module for AWS VPC

## Description

The following is a module for Amazon Web Services VPC (Virtual Private Cloud). The module can be included in any environment you want to create private cloud for example prod, stg, dev or testing.

## Variables

```vpc_cidr:``` 

Mention the cidr block, can refer to the Resource setion for recommedation.

```env:```

Mention the environment name prod, stg, dev or testing in the file in which module is called.


## Resource 

```cidr_block``` 

When you create a VPC, AWS recommends that you specify a CIDR block (of /16 or smaller) from the private IPv4 address ranges as specified in RFC 1918:
    
    10.0.0.0 - 10.255.255.255 (10/8 prefix)
    172.16.0.0 - 172.31.255.255 (172.16/12 prefix)
    192.168.0.0 - 192.168.255.255 (192.168/16 prefix)

```enable_dns_support```

To enable to resolve dns within the VPC, one needs to set the boolen "true".

```enable_dns_hostnames```

To enable instance to get hostname, one needs to set the boolen "true".


## Output

```vpc_id:```

To use the VPC ID in any other resource or module, the above attribute is used.

```vpc_cidr:```

To use the VPC CIDR in any other resource or module, the above attribute is used.

```vpc_main_route_table:```

To use the VPC main route table id in any other resource or module, the above attribute is used.


# Example:

```
module "vpc" {
  source = "github.com/jyotirbhandari/terraform/aws/modules/vpc"
  vpc_cidr = "192.168.0.0/16"
  env = "dev"
}
```
