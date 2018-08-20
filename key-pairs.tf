resource "aws_key_pair" "public" {
  key_name = "public"
  public_key = "${file("~/.ssh/terraform_aws_key.pub")}"
}
