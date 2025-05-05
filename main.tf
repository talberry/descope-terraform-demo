provider "descope" {
  project_id     = var.project_id
  management_key = var.management_key
}

resource "descope_project" "my_project" {
  name = "BCBS Stellarus CIAM Demo - PROD"
  environment = "production"

  flows = {
    "sign-up-or-in" = {
      data = file("${path.module}/flows/flows/sign-up-or-in/contents.json")
    },
    "sign-in" = {
      data = file("${path.module}/flows/flows/sign-in/contents.json")
    },
    "sign-up" = {
      data = file("${path.module}/flows/flows/sign-up/contents.json")
    },
    "sso-config-request" = {
      data = file("${path.module}/flows/flows/sso-config-request/contents.json")
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
    ],
    "smtp": [
      {
        name = "SMTP Connector"
        authentication = {
          "username" = "a1590ce4b6f834"
          "password" = "bb6e89779e35ff"
        }
        sender = {
          "email" = "bd3ed16c48-30b04d+1@inbox.mailtrap.io"
        }
        server = {
          "host" = "sandbox.smtp.mailtrap.io"
          "port" = "587"
        }
      }
    ]
  }
}
