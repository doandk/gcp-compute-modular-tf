module "compute_engine" {
  # No Public IP
  # source = "../modules/compute-engine-private/"

  # With Public IP  
  source = "../modules/compute-engine-public/"
 
  num_nodes	= 1
  name	        = "kata-app"
  machine_type	= "n1-standard-1"
  zone	        = ["asia-southeast1-b"]

  # Network Detail
  network_name  = "default"

  tags_network  = ["app-staging"]
  
  # CentOS 7
  image_family            = "centos-7"
  # Ubuntu
  # image_name		   = "ubuntu-1604-lts"
  disk_size_gb             = 10
  # SSD
  disk_type                = "pd-ssd"
  # HDD
  disk_type      	   = "pd-standard" 
  
  startup_script	   = "./script/startup_script.sh"
  
  gce_ssh_user             = "doandk"
  ssh_public_key_filepath  = "./pubkey/dk-key.pub"

  compute_labels = {
    "createdby"   = "terraform"
    "environment" = "staging"
  }
}

#############################
 
output "compute_private_ip" {
  description = "List of private IP addresses assigned to the instances, if applicable"
  value       = "${module.compute_engine.private_ip}"
}
 
output "compute_public_ip" {
  description = "List of private IP addresses assigned to the instances, if applicable"
  value       = "${module.compute_engine.public_ip}"
}
