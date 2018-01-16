# Module for AWS EFS

## Description

The following is a module for Amazon Web Services Elasticache (Redis or Memcached). The module can be included in any environment.

## Variables

```env```

Mention the environment name prod, stg, dev or testing in the file in which module is called.

```name``` 

Mention the name you want to refer to your Elasticache.

```elasticache_family``` 

Mention the elasticache family, example ```redis3.2```.

```elasticache_engine``` 

Mention the engine of the elasticache cluster, ```memcached``` or ```redis```.

```elasticache_node_type``` 

Mention the node or instance type. 

```elasticache_nodes_num``` 

Mention the number of nodes to be in the cluster. 

```elasticache_port``` 

Mention the port for the elasticache cluster, default is ```6379/11211```.

```elasticache_subnet_group``` 

Mention the name of the subnet group.

```elasticache_security_groups``` 

Mention the name of the security group. 


## Resource 

```aws_elasticache_parameter_group``` 

Create a resource elasticache parameter group.

```aws_elasticache_cluster```

Create a resource elasticache clsuter.


## Output

```elasticache_addr```

To use the fqdn address of the elasticache node, the above attribute is used.


# Example

```
module "elasticache" {
  source = "github.com/jyotirbhandari/terraform/aws/modules/elasticache"
  env = "dev"
  name = "redis"
  elasticache_family = "redis3.2"
  elasticache_engine = "redis"
  elasticache_node_type = "cache.t2.nano"
  elasticache_nodes_num = 1
  elasticache_port = "6379"
  elasticache_subnet_group = "${module.networking.elasticache_subnet_group}"
  elasticache_security_groups = "${module.sg.sg_id}"
}
```
