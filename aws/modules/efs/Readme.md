# Module for AWS EFS

## Description

The following is a module for Amazon Web Services EFS (Elastic File System). The module can be included in any environment.

## Variables



```env```

Mention the environment name prod, stg, dev or testing in the file in which module is called.

```name``` 

Mention the name you want to refer to your EFS.

```perf_mode``` 

Mention the performance mode for the file system.

```efs_subnet_ids``` 

Mention the subnets ids, must be string and comma seperated.

```efs_security_groups``` 

Mention the security groups. Type is list. 

## Resource 

```aws_efs_file_system``` 

Create a resource elastic file system, also mention the performance mode.

```aws_efs_mount_target```

Create a resource elastic file system mount target.


## Output

```efs_id```

To use the EFS mount ID in any other resource or module, the above attribute is used.

```efs_dbs```

To use the EFS dns name for given subnet in any other resource or module, the above attribute is used.


# Example

```
module "efs" {
  source = "github.com/jyotirbhandari/terraform/aws/modules/efs"
  efs_subnet_ids = "${join(",", module.networking.private_subnets)}"
  efs_security_groups = ["${module.sg.sg_id}"]
  perf_mode = "maxIO"
  env = "dev"
  name = "devefs"
}
```
