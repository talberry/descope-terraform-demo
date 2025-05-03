provider "descope" {
  project_id     = var.project_id
  management_key = var.management_key
}

resource "descope_project" "my_project" {
  name = "BCBS Stellarus CIAM Demo - PROD"
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
    },
    "forgot-password" = {
      data = file("${path.module}/flows/forgot-password.json")
    }
  }

  connectors = {
    "http": [
      {
        name = "Radiant Logic"
        description = "Radiant Logic Connector for JIT"
        base_url = "https://test-descope.free.beeceptor.com"
      }
    ],
    "hibp": [
      {
        name = "Have I Been Pwned"
        description = "Connector for Checking Password Breaches"
      }
    ],
    "forter": [
      {
        name = "Forter"
        secret_key = "<secret_key>"
        site_id = "<example_site_id>"
      }
    ]
  }
}
