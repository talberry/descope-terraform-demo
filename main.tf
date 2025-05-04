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
    ],
    "mailersend": [
      {
        name = "MailerSend Connector"
        api_key = "mlsn.614d2318b6d7b8749ea8069689236678ce64f0911b5e2bf60c242c08f9d2aff9"
        sender = "test-86org8eeo0egew13@mlsender.net"
      }
    ]
  }
}
