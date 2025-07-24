resource "aws_sns_topic" "test_topic" {
  name = var.sns_topic_name
}