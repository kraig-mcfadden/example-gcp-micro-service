// in order for this provider to work, the env var GOOGLE_CREDENTIALS needs to be set
// creds can also be passed in through the `credentials` input
provider "google" {
  project = "my-project"
  region  = "us-west"
  zone    = "us-west1-a"

  // these will be applied to all resources created in Google Cloud by this provider
  default_labels = {
    service = local.app_name
    environment = var.environment
    team = local.team_name
  }
}

// user-defined local variables
locals {
    app_name = "my-app-name"
    team_name = "my-team"
}

// set up a service account for your compute to use - permissions to use other resources will
// be attached to this service account
resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = "${local.app_name} - ${var.environment}"
}

// this is how we might provision a PubSub topic and give our service account permission to publish to it
module "my_topic" {
  source = "git@github.com:kraig-mcfadden/terraform-gcp-pubsub-topic"
  topic_name = "${replace(local.app_name, "-", "_")}-events"
  environment = var.environment
  service_account_members = [google_service_account.service_account.member]
}
