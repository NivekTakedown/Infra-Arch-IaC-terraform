terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
}

# Repository Creation
resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

  template {
    owner                = "github"
    repository           = "terraform-template-module"
    include_all_branches = true
  }
}


# Branch Creation
resource "github_branch" "development" {
  repository = github_repository.example.name
  branch     = "development"
  depends_on = [github_repository.example]
}

resource "github_branch" "staging" {
  repository = github_repository.example.name
  branch     = "staging"
  depends_on = [github_repository.example]
}

resource "github_branch" "feature" {
  repository = github_repository.example.name
  branch     = "feature"
  depends_on = [github_repository.example]
}

