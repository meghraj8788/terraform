variable "ec2_instance_type" {
    default = "t2.micro"
    type = string
}

variable "ec2_root_storage_size" {
    default = 5
    type = number
}

variable "ec2_ami_id" {
    default = "ami-049442a6cf8319180"
    type = string
}
variable "env" {
  default = "dev"
  type =  string
}
