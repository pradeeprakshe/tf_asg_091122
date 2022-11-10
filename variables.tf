##############################################################################
# GENERAL CONFIGURATION PARAMETERS
##############################################################################
variable "aws_region" {
  type        = string
  description = "AWS region. Only used for creating resource names using naming module"
  default     = "us-east-1"

  validation {
    condition     = contains(["us-east-1", "us-west-2", "eu-west-1", "eu-central-1", "ap-southeast-2"], var.aws_region)
    error_message = "Valid values are us-east-1, us-west-2, eu-west-1, eu-central-1, ap-southeast-2."
  }
}

variable "product_code_tag" {
  type        = string
  description = "PRD code to include in resource naming. This should be in the format PRDXXX/PRDXXXX."

  validation {
    condition = can(regex("^(PRD)[0-9]{3,4}$",
    var.product_code_tag))
    error_message = "Product code should be in format: PRDXXX/PRDXXXX."
  }
}

variable "environment_tag" {
  type        = string
  description = "Environment name, used for tagging and naming resources"
}

variable "inventory_code_tag" {
  type        = string
  description = "Inventory Code, used for tagging and naming resources"
}

variable "product_name" {
  type        = string
  description = "Product Name, used for naming resources"
}

variable "account_tag" {
  type        = string
  description = "Account Tag, used for naming resources"
}

variable "aws_profile" {
  type        = string
  description = "The AWS profile to use."
}

variable "iac_repo" {
  type        = string
  description = "The repository where the infrastructure-as-code exists."
}

variable "vpc_cidr" {
	default = "10.X.X.X/16"
}

variable "subnets_cidr" {
	type = "list"
	default = ["10.X.X.X/24", "10.X.X.X/24"]
}

variable "azs" {
	type = "list"
	default = ["us-east-1a", "us-east-1b"]
}

variable "required_ami" {
  default = "ami-0ff8a91507f77f867XXX"
}

variable "instance_type" {
  default = "t2.XXXXX"
}

variable "ec2key" {
  default = "t2.key"
}



##############################################################################
# TEMPLATES CONFIGURATION PARAMETERS
##############################################################################
#variable "vpc" {
#  type        = string
#  description = "The VPC Name"
#}

