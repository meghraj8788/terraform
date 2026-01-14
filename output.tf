  # * used cause we create multiple instance at same time so we are using it like array and give all instance info 
# this is user when we not use for each while create instance if we use for_each for that output will be used in 2 nd format
  # output "ec2_public_ip" {
  #   value = aws_instance.my_instance[*].public_ip
  # }

  # output "ec2_public_dns" {
  #     value = aws_instance.my_instance[*].public_dns
      
  # }

  # output "ec2_private_key" {
  #   value =  aws_instance.my_instance[*].private_ip 
  # }

output "ec2_public_ip" {
  value = [
    for key in aws_instance.my_instance : key.public_ip
  ]
}

output "ec2_public_dns" {
  value = [
    for key in aws_instance.my_instance : key.public_dns
  ]
}

output "ec2_private_ip" {
  value = [
    for key in aws_instance.my_instance : key.private_ip
  ]
}