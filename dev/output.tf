# Existing Outputs (unchanged)
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_az1_id" {
  value = aws_subnet.public_az1.id
}

output "subnet_az2_id" {
  value = aws_subnet.public_az2.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "route_table_id" {
  value = aws_route_table.public_rt.id
}

# -----------------------------------------
# Security Group Outputs
# -----------------------------------------
output "alb_sg_id" {
  description = "Security Group ID of the ALB"
  value       = aws_security_group.alb_sg.id
}

output "ecs_sg_id" {
  description = "Security Group ID of the ECS tasks"
  value       = aws_security_group.ecs_sg.id
}

# -----------------------------------------
# ALB Outputs
# -----------------------------------------
output "alb_dns_name" {
  description = "DNS name of the ALB - use this to access your app"
  value       = aws_lb.main.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_target_group_arn" {
  description = "ARN of the ALB Target Group"
  value       = aws_lb_target_group.ecs_tg.arn
}

output "app_url" {
  description = "Your application URL - open this in browser"
  value       = "http://${aws_lb.main.dns_name}"
}

# -----------------------------------------
# ECS Outputs
# -----------------------------------------
output "ecs_cluster_name" {
  description = "ECS Cluster name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_cluster_arn" {
  description = "ECS Cluster ARN"
  value       = aws_ecs_cluster.main.arn
}

output "ecs_service_name" {
  description = "ECS Service name"
  value       = aws_ecs_service.main.name
}

output "ecs_task_definition_arn" {
  description = "ECS Task Definition ARN"
  value       = aws_ecs_task_definition.main.arn
}

output "ecs_task_execution_role_arn" {
  description = "IAM Role ARN used by ECS tasks"
  value       = aws_iam_role.ecs_task_execution_role.arn
}

output "cloudwatch_log_group" {
  description = "CloudWatch Log Group name for ECS logs"
  value       = aws_cloudwatch_log_group.ecs_logs.name
}

# -----------------------------------------
# Auto Scaling Outputs
# -----------------------------------------
output "asg_min_capacity" {
  description = "Minimum ECS task count"
  value       = aws_appautoscaling_target.ecs_target.min_capacity
}

output "asg_max_capacity" {
  description = "Maximum ECS task count"
  value       = aws_appautoscaling_target.ecs_target.max_capacity
}

