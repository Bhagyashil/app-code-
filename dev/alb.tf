# alb.tf

# -----------------------------------------
# Application Load Balancer
# -----------------------------------------
resource "aws_lb" "main" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = [
    aws_subnet.public_az1.id,
    aws_subnet.public_az2.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

# -----------------------------------------
# Target Group
# ECS tasks register here
# -----------------------------------------
resource "aws_lb_target_group" "ecs_tg" {
  name        = var.alb_target_group_name
  port        = var.container_port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"  # Required for Fargate

  health_check {
    enabled             = true
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200-399"
  }

  tags = {
    Name = var.alb_target_group_name
  }
}

# -----------------------------------------
# ALB Listener
# Listens on port 80, forwards to ECS
# -----------------------------------------
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }

  tags = {
    Name = "${var.alb_name}-http-listener"
  }
}
