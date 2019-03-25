variable "network_name" {
  default = "default"
}

variable "region" {
  default = ""
}

variable "zone" {
  default = []
}

variable "num_nodes" {
  description = "Number of nodes to create"
  default = ""
}

variable "count_start" {
  default = ""
}

variable "name" {
  description = "Name prefix for the nodes"
  default = ""
}

variable "machine_type" {
  description = "In the form of custom-CPUS-MEM, number of CPUs and memory for custom machine. https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#specifications"
  default = ""
}

variable "image_family" {
  default = ""
}

variable "disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
  default     = ""
}

variable "disk_size_gb" {
  description = "The size of the image in gigabytes."
  default = ""
}

variable "tags_network" {
	default = []
}

variable "node_tags" {
  description = "Additional compute instance network tags for the nodes."
  type        = "list"
  default     = []
}

variable "source_ranges" {
  type = "list"
  description = "A list of source CIDR ranges that this firewall applies to. Can't be used for EGRESS"
  default     = []
}

variable "target_tags" {
  type = "list"
  description = "A list of target tags for this firewall"
  default     = []
}

variable "protocol" {
  description = "The name of the protocol to allow. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp), or the IP protocol number, or all"
  default = ""
}

variable "ports" {
  type = "list"
  description = "List of ports and/or port ranges to allow. This can only be specified if the protocol is TCP or UDP"
  default     = []
}

variable "gce_ssh_user" {
        default = ""
}

variable "ssh_public_key_filepath" {
  description = "Filepath for the ssh public key"
  type        = "string"

  default = ""
}

variable "startup_script" {
	default = ""
}

variable "compute_labels" {
  type    = "map"
  default = {}
}

