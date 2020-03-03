output "iam_role_admin_arn" {
  value       = aws_iam_role.admin.arn
  description = "ARN for admin IAM role"
}

output "iam_role_read_only_arn" {
  value       = aws_iam_role.read_only.arn
  description = "ARN for read-only IAM role"
}
