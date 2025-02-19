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
  auto_init   = true  
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

