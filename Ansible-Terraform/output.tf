output "ec2_ip" {
  value = [
    for instance in aws_instance.my_instance : instance.public_ip
  ]
}