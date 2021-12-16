variable "region" {
  description = "AWS Region"
}


variable "instance_name" {
  #   default = "ec2demo"
  description = "instance name"
}
variable "ami" { 
  description = "Amazon Machine Image ID for Windows"
}

variable "type" {  
  description = "Size of VM"
}

variable "project_name" {
  default     = "TF Training"
  description = "project name"
}
variable "owner" {
  default     = "Global Logic"
  description = "name of the owner"
}

