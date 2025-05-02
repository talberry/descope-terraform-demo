provider "descope" {
  project_id     = var.project_id
  management_key = var.management_key
}

resource "descope_project" "my_project" {
  name = "CI/CD Demo Project"

  flows = {
    "sign-up-or-in" = {
      data = file("${path.module}/flows/sign-up-or-in.json")
    },
    "forgot-password" = {
      data = file("${path.module}/flows/forgot-password.json")
    }
  }
}
