resource "google_compute_instance" "doandk" {
   count = "${var.num_nodes}"
   name  = "${var.name}-${count.index + 1}"
   machine_type = "${var.machine_type}"
   zone = "${element(var.zone, count.index)}"
   tags = ["${var.tags_network}"]

   boot_disk {
      initialize_params {
      image = "${var.image_family}"
      size  = "${var.disk_size_gb}"
      type  = "${var.disk_type}"
   }
}

network_interface {
   network = "${var.network_name}"
   # erase \\ on access_config if you want use public ip
   access_config {}
}

service_account {
   scopes = ["userinfo-email","compute-ro", "storage-ro"]
   }

# Enable if you want use metadata
   metadata {
    sshKeys = "${var.gce_ssh_user}:${file(var.ssh_public_key_filepath)}"
   }

   metadata_startup_script = "${file(var.startup_script)}"

# Enable if you want use labels
  labels = "${var.compute_labels}"

}

resource "google_compute_firewall" "ssh" {
  name    = "${var.name}-rule"
  network = "${var.network_name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["${var.tags_network}"]
}
