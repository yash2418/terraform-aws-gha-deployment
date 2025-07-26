resource "aws_sns_topic" "test_topic" {
  name = var.sns_topic_name
  kms_master_key_id = "alias/aws/sns"

  tags = {
    Project     = "demo-topic"
  }
}