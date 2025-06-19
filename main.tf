provider "descope" {
  project_id     = var.project_id
  management_key = var.management_key
}

resource "descope_project" "project" {
  name = "Terraform Demo - PROD"
  environment = "production"

  flows = {
    "sign-up-or-in" = {
      data = file("${path.module}/flows/sign-up-or-in.json")
    },
    "sign-in" = {
      data = file("${path.module}/flows/sign-in.json")
    },
    "sign-up" = {
      data = file("${path.module}/flows/sign-up.json")
    }
  }

  connectors = {
    "hibp": [
      {
        name = "Have I Been Pwned"
        description = "Connector for Checking Password Breaches"
      }
    ],
    "smtp": [
      {
        name = "Email Connector"
        description = "Email Connector"
        sender = {
          email = "support@company.com"
        }
        server = {
          host = "587"
        }
        authentication = {
          username = "test"
          password = "password1"
        }
      }
    ]
  }
}
