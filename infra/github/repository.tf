resource "github_repository" "github_course_repo" {
  name = "terraform-course"
  description = "Terraform course repository"
  visibility = "private"
}

resource "github_branch" "github_course_repo_main_branch" {
  repository = github_repository.github_course_repo.id
  branch = "main"
  
}

resource "github_branch_default" "github_course_repo_default_branch" {
  repository = github_repository.github_course_repo.id
  branch = github_branch.github_course_repo_main_branch.branch
}
