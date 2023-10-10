terraform {
  // make sure GOOGLE_CREDENTIALS is set to get access to this bucket
  backend "gcs" {
    bucket  = "terraform_state_${var.environment}"
    prefix  = "terraform/state/${app_name}"
  }
}
