resource "openstack_compute_instance_v2" "vm_1" {
  name      = "vm-1-internet"
  image_name  = "Ubuntu-20.04"
  flavor_name = "standard.small"
  key_pair  = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = ["secgroup-1"]

  network {
    name = "${data.openstack_networking_network_v2.network.name}"
  }
}

resource "openstack_compute_instance_v2" "vms_no_internet" {
  count = 3
  name      = "vm-${count.index + 2}-no-internet"
  image_name  = "Ubuntu-20.04"
  flavor_name = "standard.small"
  key_pair  = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = ["secgroup-2"]

  network {
    name = "${data.openstack_networking_network_v2.network.name}"
  }
}