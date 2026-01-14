resource "aws_s3_bucket" "sbucket" {
  bucket = "meghraj-terraform-state-eu-west-1"

  tags = {
    Name = "terraform-state-bucket"
  }
}
