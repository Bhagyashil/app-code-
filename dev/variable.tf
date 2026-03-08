variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "vpc-gitlab"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnets
variable "public_subnet_az1_name" {
  type    = string
  default = "gitlab-pub-sub-az1"
}

variable "public_subnet_az2_name" {
  type    = string
  default = "gitlab-pub-sub-az2"
}

variable "public_subnet_az1_cidr" {
  description = "Public Subnet AZ1 CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_az2_cidr" {
  description = "Public Subnet AZ2 CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

# Internet Gateway
variable "igw_name" {
  type    = string
  default = "igw-gitlab"
}

# Route Table
variable "route_table_name" {
  type    = string
  default = "route-gitlab-pub"
}

# -----------------------------------------
# Security Group Variables
# -----------------------------------------
variable "alb_sg_name" {
  description = "Security Group name for ALB"
  type        = string
  default     = "gitlab-alb-sg"
}

variable "ecs_sg_name" {
  description = "Security Group name for ECS tasks"
  type        = string
  default     = "gitlab-ecs-sg"
}

# -----------------------------------------
# ALB Variables
# -----------------------------------------
variable "alb_name" {
  description = "Application Load Balancer name"
  type        = string
  default     = "gitlab-alb"
}

variable "alb_target_group_name" {
  description = "ALB Target Group name"
  type        = string
  default     = "gitlab-tg"
}

variable "health_check_path" {
  description = "Health check path for ALB target group"
  type        = string
  default     = "/"
}

# -----------------------------------------
# ECS Variables
# -----------------------------------------
variable "ecs_cluster_name" {
  description = "ECS Cluster name"
  type        = string
  default     = "gitlab-ecs-cluster"
}

variable "ecs_service_name" {
  description = "ECS Service name"
  type        = string
  default     = "gitlab-ecs-service"
}

variable "ecs_task_family" {
  description = "ECS Task Definition family name"
  type        = string
  default     = "gitlab-task"
}

variable "container_name" {
  description = "Name of the container inside task definition"
  type        = string
  default     = "gitlab-container"
}

variable "container_port" {
  description = "Port your app listens on inside the container"
  type        = number
  default     = 80
}

variable "task_cpu" {
  description = "Fargate task CPU units (256, 512, 1024, 2048, 4096)"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Fargate task memory in MB (512, 1024, 2048)"
  type        = string
  default     = "512"
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}

variable "ecr_image_uri" {
  description = "Full ECR image URI e.g. 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}

variable "log_group_name" {
  description = "CloudWatch Log Group name for ECS"
  type        = string
  default     = "/ecs/gitlab-app"
}

# -----------------------------------------
# Auto Scaling Variables
# -----------------------------------------
variable "asg_min_capacity" {
  description = "Minimum number of ECS tasks (scale down limit)"
  type        = number
  default     = 1
}

variable "asg_max_capacity" {
  description = "Maximum number of ECS tasks (scale up limit)"
  type        = number
  default     = 4
}

variable "scale_up_cpu_threshold" {
  description = "CPU utilization % to trigger scale UP"
  type        = number
  default     = 70
}

variable "scale_down_cpu_threshold" {
  description = "CPU utilization % to trigger scale DOWN"
  type        = number
  default     = 20
}
