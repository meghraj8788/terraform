module "eks" {

  #import module and version
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"
  
  #cluster info (control-plane)
  name               = "${local.name}-EKS"
  kubernetes_version = "1.33"

  # Optional
  endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id 
  subnet_ids = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  
  #manging node in the cluster
  eks_managed_node_groups = {
    meghraj-cluster = {
      
      instance_types = ["t2.medium"]
      attach_primary_security_group = true
      min_size     = 1
      max_size     = 1
      desired_size = 1
      capacity_type = "SPOT"
    }
  }
  tags = {
    Environment = local.env #it will get env from local 
    Terraform   = "true"
  }

}