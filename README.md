# Onbase-Soa-Testing-Environment
- [Overview](#overview)
- [Requirements](#requirements)
- [Providers](#providers)
- [Project Structure](#project-structure)  
    - [Jenkins Pipeline Configuration](#jenkins-pipeline-configuration)
        - [Build With Parameters in Jenkins](#build-with-parameters-in-jenkins)
    - [Terraform Configuration Files](#terraform-configuration-files)         
        - [Terraform Inputs](#terraform-inputs)
        - [Terraform Outputs](#terraform-outputs)
 - [Confluence](#confluence)
    
    
## Overview
Repository for the OnBase SOA Test Framework project to provision servers and enable database restore in each VPC private sub-net test environment.



## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_jenkins"></a> [jenkins](#requirement\_jenkins) | 2.332.1 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) |  V1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.5.0 |



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | V4.23.0 |



## Jenkins Pipeline Configuration

The Jenkins Pipeline file is containing properties tag and different stages to provision the app server, database server and storage server.



### Build With Parameters in Jenkins
```
properties([
    parameters([
	choice(choices: ['trial', 'testing', 'temp', 'feat-test-infra', 'develop'], name: 'branch'),
	string(name: 'region', trim: true, defaultValue: 'us-east-2'),
        string(name: 'env_type', trim: true, defaultValue: 'trial'),
        choice(choices: ['', 'apply', 'destroy'], name: 'action'),
	string(name: 'db_ami_name', trim: true, defaultValue: 'Onbase_Db_ami_v1'),
	string(name: 'app_ami_name', trim: true, defaultValue: 'Onbase_App_ami_v1'),
	string(name: 'storage_ami_name', trim: true, defaultValue: 'Onbase_Storage_ami_v1'),
        choice(choices: ['', 'false', 'true'], name: 'db_backup'),
        [$class: 'WHideParameterDefinition', defaultValue: '64', name: 'range'], 
        [$class: 'WHideParameterDefinition', defaultValue: '6', name: 'newbits'],
	[$class: 'DynamicReferenceParameter', choiceType: 'ET_FORMATTED_HTML', name: 'bucket', omitValueField: true, randomName: 'choice-parameter-888020034228800', referencedParameters: 'db_backup', script: [$class: 'GroovyScript', fallbackScript: [classpath: [], sandbox: false, script: ''], script: [classpath: [], sandbox: false, script: '''vappHtml = \'\'\'
        <input type="text" class="setting-input" name="value">
        \'\'\'
        if (db_backup.equals("true")) {
            return vappHtml
        }''']]],
        [$class: 'DynamicReferenceParameter', choiceType: 'ET_FORMATTED_HTML', name: 'folder', omitValueField: true, randomName: 'choice-parameter-888020041133200', referencedParameters: 'db_backup', script: [$class: 'GroovyScript', fallbackScript: [classpath: [], sandbox: false, script: ''], script: [classpath: [], sandbox: false, script: '''vappHtml = \'\'\'
        <input type="text" class="setting-input" name="value">
        \'\'\'
        if (db_backup.equals("true")) {
            return vappHtml
        }''']]],
        [$class: 'DynamicReferenceParameter', choiceType: 'ET_FORMATTED_HTML', name: 'file', omitValueField: true, randomName: 'choice-parameter-888020041914700', referencedParameters: 'db_backup', script: [$class: 'GroovyScript', fallbackScript: [classpath: [], sandbox: false, script: ''], script: [classpath: [], sandbox: false, script: '''vappHtml = \'\'\'
        <input type="text" class="setting-input" name="value">
        \'\'\'
        if (db_backup.equals("true")) {
            return vappHtml
        }''']]],
        [$class: 'DynamicReferenceParameter', choiceType: 'ET_FORMATTED_HTML', name: 'destination', omitValueField: true, randomName: 'choice-parameter-888020046019600', referencedParameters: 'db_backup', script: [$class: 'GroovyScript', fallbackScript: [classpath: [], sandbox: false, script: ''], script: [classpath: [], sandbox: false, script: '''vappHtml = \'\'\'
        <input type="text" class="setting-input" name="value" value="C:\\\\Program Files\\\\Microsoft SQL Server\\\\MSSQL15.SQLEXPRESS\\\\MSSQL\\\\Backup">
        \'\'\'
        if (db_backup.equals("true")) {
        return vappHtml
        }''']]]
    ])
])
```

<!-- BEGIN_TF_DOCS -->



## Terraform Configuration Files

```hcl
provider "aws" {
  
}

module "Onbase_child" {
  source                    = "./modules"
  availability_zone         = var.availability_zone
  private_subnet_cidr_block = var.private_subnet_cidr_block
  environment               = var.environment
  project                   = var.project
  db_inst_type              = var.db_inst_type
  app_inst_type             = var.app_inst_type
  storage_inst_type         = var.storage_inst_type
  db_ami                    = var.db_ami
  app_ami                   = var.app_ami
  key_name                  = var.key_name
}
```


### Resources

| Name |
|------|
| module.Onbase_child.aws_instance.App_instance0m will be created|
| module.Onbase_child.aws_instance.DB_instance0m will be created |
| module.Onbase_child.aws_instance.Storage_instance0m will be created|
| module.Onbase_child.aws_route_table_association.private_rt_association0m will be created|
|module.Onbase_child.aws_subnet.private_subnet0m will be created |
| Plan:[0m 5 to add, 0 to change, 0 to destroy.] |



### Terraform Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability_zone | This value represents availability zone in AWS | `string` | n/a | yes |
| private_subnet_cidr_block | The CIDR block of private subnet | `string` | n/a | yes |
| environment | team environment to create testing infrastructure | `string` | n/a | yes |
| project | name of the project | `string` | Onbase | yes |
| key_name | key name for all instances | `string` | onbase |  yes |
| db_inst_type | name of the instance type for app instance | `string` | t2.large | yes |
| app_inst_type | name of the instance type for db instance  | `string` | t2.large | yes |
| storage_inst_type | name of the instance type for storage instance   | `string` | t2.medium | yes |
| db_ami | ami id for db instance | `string` | n/a | yes |
| app_ami | ami id for app instance | `string` | n/a | yes |



### Terraform Outputs

| Name | Description |
|------|-------------|
| app_private_ip | The private IP address assigned to the app instance |
| app_private_pass | The password assigned to the app instance |
| db_private_ip | The private IP address assigned to the database instance |
| db_private_pass | The password assigned to the database instance |
| storage_private_ip | The private IP address assigned to the storage instance |
| storage_private_pass | The password assigned to the storage instance |
<!-- END_TF_DOCS -->


## Confluence
https://www.google.com/url?sa=j&url=https%3A%2F%2Fhyland.atlassian.net%2Fwiki%2Fspaces%2FCAP%2Fpages%2F214600827%2FCreation%2Bof%2BDatabase%2BServer%2Bin%2BOnBase%2BInfrastructure&uct=1639622850&usg=HKNy-hZIuyWhM4liFuiTgd3SC6I.&source=chat

https://id.atlassian.com/login?continue=https%3A%2F%2Fid.atlassian.com%2Fjoin%2Fuser-access%3Fresource%3Dari%253Acloud%253Aconfluence%253A%253Asite%252F252cce86-035e-4b0e-abd2-3c002935632f%26continue%3Dhttps%253A%252F%252Fhyland.atlassian.net%252Fwiki%252Fspaces%252FCAP%252Fpages%252F290985008%252FCreation%252Bof%252BApplication-Test%252BServer%252Bin%252BOnBase%252BInfrastructure&application=confluence



