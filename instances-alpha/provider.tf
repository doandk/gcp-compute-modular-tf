# Cloud Provider Details
 
provider "google" {
credentials = "${file("~/.config/gcloud/tf-admin.json")}"
project = "focus-reality-199209"
region = "asia-southeast-1"
}

