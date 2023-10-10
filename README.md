# example-gcp-micro-service
An example of how I might go about setting up a GCP microservice with Terraform, Docker, and Github Actions.

Uses Rust as the language but that's just because I had good examples already - feel free to swap out for your preferred language.

Terraform files should be updated to use your actual names and configs.

CI/CD pipeline needs to be uncommented and updated with your preferred language's build steps, and the variables passed into the Terraform apply need to be updated to be real values.

`GOOGLE_CREDENTIALS` needs to be set in your GitHub repo with actual creds to access your GCP project.
