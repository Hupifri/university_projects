resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "my_tf_key"
  public_key = "XXXXXX"
}

# SECURITY GROUPS
# Security group 1
resource "openstack_networking_secgroup_v2" "secgroup_1" {
  name        = "secgroup-1"
  description = "only SSH and HTTP from internet"
}

resource "openstack_networking_secgroup_rule_v2" "ssh_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "http_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

resource "openstack_networking_secgroup_rule_v2" "project_network_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "192.168.1.0/24"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}



# Security group 2
resource "openstack_networking_secgroup_v2" "secgroup_2" {
  name        = "secgroup-2"
  description = "All network traffic allowed"
}

resource "openstack_networking_secgroup_rule_v2" "ingress_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "192.168.1.0/24"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  security_group_id = openstack_networking_secgroup_v2.secgroup_2.id
}

