resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "store-state-file-id"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "store-state-file-id"
  }
}