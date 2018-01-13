# Module for AWS VPC Networking (Public and Private subnets)

## Description

The following is a module for Amazon Web Services VPC Networking, especially for Public Private Subnets or just Public Subnets. The module can be included in any environment you want but need to be inside VPC. Best practice would be to use vpc module and networking module in same parent file in respective environment. 

## Variables

```vpc_id``` 

Mention the VPC ID of the VPC, usually refered to the output attribute.

```vpc_main_route_table``` 

Mention the VPC main route table, usually refered to the output attribute.

```env```

Mention the environment name prod, stg, dev or testing in the file in which module is called.

```aws_region```

Mention the AWS region to be used.

```vpc_public_subnets```

Mention the subnets you want to segregate for public. Type is list.

```vpc_private_subnets```

Mention the subnets you want to segregate for private. Type is list.

```vpc_database_subnets```

Mention the subnets you want to segregate for database (RDS). Type is list.

```vpc_elasticache_subnets```

Mention the subnets you want to segregate for elasticache. Type is list.

```nat_id```

Mention the nat instance id, usually for routing internet to private subnets.

```gw_id```

Mention the gateway id, if you do not intend to use nat instance id.

## Resource 

```aws_subnet```

Create resource for public, private, database, elasticacahe etc subnets inside VPC.


```aws_db_subnet_group```

Create resource for database subnets group basically RDS subnet group.

```aws_elasticache_subnet_group```

Create resource for Elasticache subnets group.

```aws_internet_gateway```

Create internet gateway for public subnet.

```aws_route```

Create route to internet via default table.

```aws_route_table_association```

Associating subnets to public, private, elasticache, database route table.

```aws_route_table```

Create route table for usually for private subnets.


## Output

```public_subnets```

To use the Public subnets in a list format in any other resource or module, the above attribute is used.

```private_subnets```

To use the Private subnets in a list format in any other resource or module, the above attribute is used.

```database_subnets```

To use the Database (RDS) subnets in a list format in any other resource or module, the above attribute is used.

```elasticache_subnets```

To use the Elasticache subnets in a list format in any other resource or module, the above attribute is used.

```database_subnet_group```

To use the Database subnets group id in any other resource or module, the above attribute is used.

```elasticache_subnet_group```

To use the Elasticache subnets group id in any other resource or module, the above attribute is used.

```public_subnets_cidr_block```

To use the Public subnets cidr block in a list format in any other resource or module, the above attribute is used.

```private_subnets_cidr_block```

To use the Private subnets cidr block in a list format in any other resource or module, the above attribute is used.

```internet_gw```

To use internet gateway id in any other resource or module, the above attribute is used.

# Example

The scenario is explained with two examples, the first is for Public and Private subnets and the second is for only Public subnets.

# Public and Private Subnets VPC

```
module "networking" {
  source = "github.com/jyotirbhandari/terraform/aws/modules/networking"
  vpc_id = "${module.vpc.vpc_id}"
  vpc_main_route_table = "${module.vpc.vpc_main_route_table}"
  nat_id = "${aws_instance.nat.id}"
  vpc_public_subnets = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24", "192.168.5.0/24" ]
  vpc_private_subnets = ["192.168.20.0/24", "192.168.21.0/24", "192.168.22.0/24", "192.168.23.0/24", "192.168.24.0/24", "192.168.25.0/24"]
  vpc_database_subnets = ["192.168.50.0/24", "192.168.51.0/24", "192.168.52.0/24", "192.168.53.0/24", "192.168.54.0/24", "192.168.55.0/24"]
  vpc_elasticache_subnets = ["192.168.60.0/24", "192.168.61.0/24", "192.168.62.0/24", "192.168.63.0/24", "192.168.64.0/24", "192.168.65.0/24"]
  env = "dev"
}
```

# Public Subnets VPC only

```
module "networking" {
  source = "github.com/jyotirbhandari/terraform/aws/modules/networking"
  vpc_id = "${module.vpc.vpc_id}"
  vpc_main_route_table = "${module.vpc.vpc_main_route_table}"
  vpc_public_subnets = ["192.168.10.0/24", "192.168.20.0/24"]
  gw_id = "${module.networking.internet_gw}"
  env = "dev"
}
```
