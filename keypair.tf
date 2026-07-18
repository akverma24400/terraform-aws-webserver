resource "aws_key_pair" "terraweek" {
  key_name   = "terraweek-key"
  public_key = file("${path.module}/terraweek-key.pub")
}