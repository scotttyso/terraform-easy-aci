application_epgs = {
  "asgard-client" = {
    application_profile = "vmware"
    bridge_domain       = "asgard-client"
    description         = "Asgard Client EPG"
    domains = [
      {
        domain               = "access"
        domain_type          = "physical"
        resolution_immediacy = "immediate"
      }
    ]
    preferred_group_member = true
    static_paths = [
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootA"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1104]
      },
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootB"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1104]
      }
    ]
    tenant   = "skunkworks"
    useg_epg = false
    vrf      = "prod"
  }
  "asgard-mgmt" = {
    application_profile = "vmware"
    bridge_domain       = "asgard-mgmt"
    description         = "Asgard Management EPG"
    domains = [
      {
        domain               = "access"
        domain_type          = "physical"
        resolution_immediacy = "immediate"
      }
    ]
    preferred_group_member = true
    static_paths = [
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootA"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1101]
      },
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootB"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1101]
      }
    ]
    tenant                 = "skunkworks"
    useg_epg               = false
    vrf                    = "prod"
  }
  "asgard-migration" = {
    application_profile = "vmware"
    bridge_domain       = "asgard-migration"
    description         = "Asgard Migration EPG"
    domains = [
      {
        domain               = "access"
        domain_type          = "physical"
        resolution_immediacy = "immediate"
      }
    ]
    preferred_group_member = true
    static_paths = [
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootA"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1102]
      },
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootB"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1102]
      }
    ]
    tenant                 = "skunkworks"
    useg_epg               = false
    vrf                    = "prod"
  }
  "asgard-storage" = {
    application_profile = "vmware"
    bridge_domain       = "asgard-storage"
    description         = "Asgard Storage EPG"
    domains = [
      {
        domain               = "access"
        domain_type          = "physical"
        resolution_immediacy = "immediate"
      }
    ]
    preferred_group_member = true
    static_paths = [
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootA"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1103]
      },
      {
        encapsulation_type = "vlan"
        mode               = "trunk"
        name               = "grootB"
        nodes              = [101,102]
        path_type          = "vpc"
        pod                = 1
        vlans              = [1103]
      }
    ]
    tenant                 = "skunkworks"
    useg_epg               = false
    vrf                    = "prod"
  }
}