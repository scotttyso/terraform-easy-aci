application_epgs = {
  "Web1" = {
    application_profile = "Apps"
    bridge_domain       = "Apps"
    description         = "Web1 EPG"
    domains = [{
      domain        = "thor"
      domain_type   = "vmm"
      domain_vendor = "VMware"
    }]
    preferred_group_member = true
    tenant                 = "destroy"
    useg_epg               = false
    vrf                    = "prod"
  }
}