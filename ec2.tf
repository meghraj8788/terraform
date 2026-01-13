#add key pair first
resource aws_key_pair my_key {
    key_name = "terra-key"
    public_key = file("terra-key.pub") 
}

#add default vpc
resource aws_default_vpc default {
 
}

#security group
resource aws_security_group my_group {
    name = "automate-sg"
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
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_group.name]
    instance_type = var.ec2_instance_type
    ami = var.ec2_ami_id
    user_data= file("install_nginx.sh")

    root_block_device {
        volume_size = var.ec2_root_storage_size
        volume_type = "gp3"
    }
    tags = {
        Name = "meghraj-terraform-ec2"
    }

}