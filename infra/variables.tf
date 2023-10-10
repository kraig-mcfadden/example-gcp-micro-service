variable "environment" {
    type = string
    description = "staging or prod"
}

variable "account_id" {
    type = string
    description = "ID of the Google Cloud account we're provisioning in"
}