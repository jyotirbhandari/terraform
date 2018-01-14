# Module for Random shuffle of subnets

## Description

The following is a module for random shuffle of subnets. The module takes a unique value, but need to use it with ```terraform taint```. What is the benefits of using random shuffle, random shuffle helps to initiate a resource mostly an instance in different subnets mapped to prescribed availability zone. Mostly, useful in cluster setup initiated in different availability zone.

# How to use

The following command can be executed once you integrated the module in your infrastructure. The example is for private subnets tainting.

```terraform taint --module=random_subnets random_shuffle.private```

Once you have executed above command or in process to execute it, just make sure that ```subnet_id``` argument is in ```ignore_changes``` of all the resource. This will disable any resource from getting destroyed.

```
lifecycle {
    ignore_changes = ["subnet_id"]
  }
```

## Variables

```public_subnets```

Mention the subnets you want to segregate for public. Type is list.

```private_subnets```

Mention the subnets you want to segregate for private. Type is list.

```database_subnets```

Mention the subnets you want to segregate for database (RDS). Type is list.

```elasticache_subnets```

Mention the subnets you want to segregate for elasticache. Type is list.


## Resource 

```random_shuffle```

Create resource random shuffle for public, private, database, elasticacahe etc subnets.


## Output

```random_public_subnets```

To use the shuffled Public subnet with a random value, the above attribute is used.

```random_private_subnets```

To use the shuffled Private subnet with a random value, the above attribute is used.

```random_database_subnets```

To use the shuffled Database subnet with a random value, the above attribute is used.

```random_elasticache_subnets```

To use the shuffled Elasticache subnet with a random value, the above attribute is used.


# Example

```
  module "random_subnets" {
  source = "github.com/jyotirbhandari/terraform/aws/modules/random_subnets"
  public_subnets = "${module.networking.public_subnets}"
  private_subnets = "${module.networking.private_subnets}"
  database_subnets = "${module.networking.database_subnets}"
  elasticache_subnets = "${module.networking.elasticache_subnets}"
}
```
