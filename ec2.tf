#add key pair first
resource aws_key_pair my_key {
    key_name = "terra-key-dev"
    public_key = file("terra-key.pub") 
}

#add default vpc
resource aws_default_vpc default {
 
}

#security group
resource aws_security_group my_group {
    name = "automate-sg-dev"
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id      = aws_default_vpc.default.id

    #inbound rule
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #to open port 80 we have to create one more
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    #outbound rule
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #optional
    tags = {
        Name = "automate-sg"
  }
}

resource "aws_instance" "my_instance" {
    #count = 2 it will create 2 instance but name will be same to create diff name we use for for_each = associate_public_ip_address =  
    for_each = tomap({
        meghraj-terra-one-dev = "t2.micro"
    })

    key_name = aws_key_pair.my_key.key_name
    vpc_security_group_ids = [aws_security_group.my_group.id]
    #security_groups = [aws_security_group.my_group.name]
    instance_type = each.value
    ami = var.ec2_ami_id
    user_data= file("install_nginx.sh")

    # root_block_device {
    #     volume_size = var.ec2_root_storage_size
    #     volume_type = "gp3"
    # }
    # it just want to test conditional expressions (if else)
    #conditional statement = if else
    #if true ? apply this : if false apply this 
    root_block_device {
         volume_size = var.env == "prd" ? 15 : var.ec2_root_storage_size
         volume_type = "gp3"
     }

    tags = {
        Name = each.key
        Envoirment = var.env
    }

}