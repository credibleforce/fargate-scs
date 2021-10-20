resource "aws_ecr_repository" "splunK_sc4s" {
  name                 = "${var.name}-${var.environment}"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_lifecycle_policy" "splunK_sc4s" {
  repository = aws_ecr_repository.splunK_sc4s.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 10 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
    }]
  })
}