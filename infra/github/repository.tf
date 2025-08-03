resource "github_repository" "github_course_repo" {
  name = "terraform-course"
  description = "Terraform course repository"
  visibility = "public"
}

resource "github_branch" "github_course_repo_main_branch" {
  repository = github_repository.github_course_repo.id
  branch = "main"
  
}

resource "github_branch_default" "github_course_repo_default_branch" {
  repository = github_repository.github_course_repo.id
  branch = github_branch.github_course_repo_main_branch.branch
}

resource "github_repository_ruleset" "github_course_repo_main_ruleset" {
  name        = "protect_default_branch"
  repository  = github_repository.github_course_repo.id
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = [ "~DEFAULT_BRANCH" ]
      exclude = []
    }
  }

  rules {
    deletion                = true
    required_linear_history = true
    non_fast_forward = true
  }
}