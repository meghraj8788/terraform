resource "aws_s3_bucket" "sbucket" {
  bucket = "${var.env}-bucket-infra-module"

  tags = {
    Name = "${var.env}-bucket-infra-module"
    Environment = var.env
  }
}
