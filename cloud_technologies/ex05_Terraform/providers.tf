terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  user_name = "XXXXXX"
  password  = "XXXXXX"
  tenant_id = "XXXXXX"
  region    = "XXXXXX"
  auth_url  = "XXXXXX"
  user_domain_name = "XXXXXX"
}