resource "aws_dynamodb_table" "devops14-dynamodb-table" {
  hash_key         = "LockID"
  name             = "devops14-tf-state-lock-test"
  write_capacity     = 10
  read_capacity      = 10  

  attribute {
    name = "LockID"
    type = "S"
  }
}
