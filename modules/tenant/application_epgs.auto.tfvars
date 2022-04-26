application_epgs = {
  # "App1" = {
  #   application_profile = "Apps"
  #   bridge_domain       = "Apps"
  #   description         = "App1 EPG"
  #   contracts = [
  #     # {
  #     #   contract        = "app_filter"
  #     #   contract_tenant = "common"
  #     #   contract_type   = "provider"
  #     # },
  #     # {
  #     #   contract        = "default"
  #     #   contract_tenant = "common"
  #     #   contract_type   = "consumer"
  #     # }
  #   ]
  #   domains = [{
  #     domain        = "thor"
  #     domain_type   = "vmm"
  #     domain_vendor = "VMware"
  #   }]
  #   preferred_group_member = false
  #   tenant                 = "prod"
  #   useg_epg               = false
  #   vrf                    = "prod"
  # }
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
    tenant                 = "prod"
    useg_epg               = false
    vrf                    = "prod"
  }
}