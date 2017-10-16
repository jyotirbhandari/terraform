# The following setup only includes automating elasticbeanstalk

Assuming that you have already setup credentials for AWS, with access and secret keys. You only need to clone the repository and follow mentioned steps.

Change directory to the environment, just one environment is available as of now.

```
cd terraform/aws/env/dev

```

Once you are in the dev enviroment directory, run following command to get elasticbeanstalk modules.

```
terraform get
```

Now you are ready to go with the setup, but before executing apply command, its better to cross verify the status with plan command

```
terraform plan
```

If no errors are displayed and the plan is ready to execute run following command.

```
terraform apply
```
