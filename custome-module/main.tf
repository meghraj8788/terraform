#prd infra
module "prd-infra" {
    source = "./module-infra"
    env =  "prd" 
    instance_count = 1 
    ec2_instance_type = "t2.micro"
    ec2_ami_id = "ami-049442a6cf8319180"
    hash_key = "studentID"
  
}

#dev infra
module "dev-infra" {
    source = "./module-infra"
    env =  "dev" 
    instance_count = 1
    ec2_instance_type = "t2.micro"
    ec2_ami_id = "ami-049442a6cf8319180"
    hash_key = "studentID"
  
}

#stage infra
module "stg-infra" {
    source = "./module-infra"
    env =  "stg"
    instance_count = 1 
    ec2_instance_type = "t2.micro"
    ec2_ami_id = "ami-049442a6cf8319180"
    hash_key = "studentID"
  
}