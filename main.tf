provider "descope" {
  project_id     = var.project_id
  management_key = var.management_key
}

resource "descope_project" "my_project" {
  name = "BCBS POC - PROD"
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
    "idp-initiated-sso" = {
      data = file("${path.module}/flows/idp-initiated-sso.json")
    },
    "sign-up-or-in-using-users-preferred-mfa-method" = {
      data = file("${path.module}/flows/sign-up-or-in-using-users-preferred-mfa-method.json")
    },
    "preferred-mfa-flow" = {
      data = file("${path.module}/flows/preferred-mfa-flow.json")
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
    ]
  }
}
