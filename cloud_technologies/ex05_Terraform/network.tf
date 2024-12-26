data "openstack_networking_network_v2" "network" {
  name = "project_2011893"
}

# FLOATING IPs

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "public"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.fip_1.address
  instance_id = openstack_compute_instance_v2.vm_1.id
}