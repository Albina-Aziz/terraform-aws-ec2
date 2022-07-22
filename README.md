# Onbase-Soa-Testing-Environment
- [Project Structure](#project-structure)  
    - [Jenkins Pipeline Configuration](#configure-and-run-jenkins-pipeline-jobs)
    - [Terrafor Configuration Files](#terraform-configurations)
    - [Shell script Files](#shell-scripting-to-perform-remote-tasks-on-jenkins-server)
    - [Powershell Scripts Files] (#powershell-scripting-to-perform-remote-tasks-on-appserver-and-dbserver)


## Jenkins Pipeline 
The Jenkins Pipeline file is containing properties tag and different stages to provision the app server, database server and storage server. 

<!-- BEGIN_TF_DOCS -->


## Terrafor Configuration Files

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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [jenkins](#requirement\_jenkins) | 2.332.1 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) |  V1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | V4.23.0 |


## Resources

| Name |
|------|
| module.Onbase_child.aws_instance.App_instance[0m will be created|
| module.Onbase_child.aws_instance.DB_instance[0m will be created |
| module.Onbase_child.aws_instance.Storage_instance[0m will be created|
| module.Onbase_child.aws_route_table_association.private_rt_association[0m will be created|
|module.Onbase_child.aws_subnet.private_subnet[0m will be created |
| Plan:[0m 5 to add, 0 to change, 0 to destroy. |


## Terraform Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability_zone | This value represents availability zone in AWS | `string` | n/a | yes |
| private_subnet_cidr_block | The CIDR block of private subnet | `string` | n/a | yes |
| availability_zone | This value represents availability zone in AWS | `string` | n/a | yes |
| availability_zone | This value represents availability zone in AWS | `string` | n/a | yes |
| availability_zone | This value represents availability zone in AWS | `string` | n/a | yes |
| availability_zone | This value represents availability zone in AWS | `string` | n/a | yes |
| availability_zone | This value represents availability zone in AWS | `string` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | n/a |
| <a name="output_aws_route53_name_servers"></a> [aws\_route53\_name\_servers](#output\_aws\_route53\_name\_servers) | n/a |
| <a name="output_cloudfront_url"></a> [cloudfront\_url](#output\_cloudfront\_url) | n/a |
| <a name="output_hosted_website_endpoint"></a> [hosted\_website\_endpoint](#output\_hosted\_website\_endpoint) | The Endpoint of Control Plane UI Website. |
| <a name="output_s3_api_bucket_name"></a> [s3\_api\_bucket\_name](#output\_s3\_api\_bucket\_name) | The s3 bucket name where the Control Plane API will be hosted. |
| <a name="output_s3_ui_bucket_name"></a> [s3\_ui\_bucket\_name](#output\_s3\_ui\_bucket\_name) | The s3 bucket name where the Control Plane UI will be hosted. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The Hosted Zone ID. This can be referenced by zone records. |


<!-- END_TF_DOCS -->

## Authors




