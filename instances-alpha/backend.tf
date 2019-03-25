# Using gcloud-storage to store state.

terraform {
 backend "gcs" {
   bucket = "focus-reality-modular"
   prefix  = "terraform/state/kata-demo"
 }
}

