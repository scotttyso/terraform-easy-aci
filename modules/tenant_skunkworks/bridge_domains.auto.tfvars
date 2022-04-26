bridge_domains = {
  "asgard-client" = {
    general = [{
      arp_flooding = true
      description  = "Asgard Client Bridge Domain"
      tenant       = "skunkworks"
      vrf          = "prod"
      vrf_tenant   = "common"
    }]
    l3_configurations = [{
      associated_l3outs = [{
        l3out        = "prod"
        l3out_tenant = "common"
      }]
      subnets         = []
      unicast_routing = false
    }]
  }
  "asgard-mgmt" = {
    general = [{
      advertise_host_routes = true
      arp_flooding          = true
      description           = "Asgard Management Bridge Domain"
      tenant                = "skunkworks"
      vrf                   = "prod"
      vrf_tenant            = "common"
    }]
    l3_configurations = [{
      associated_l3outs = [{
        l3out        = "prod"
        l3out_tenant = "common"
      }]
      subnets = [{
        gateway_ip = "10.92.101.1/24"
        scope = [{
          advertise_externally = true
        }]
      }]
      unicast_routing = true
    }]
  }
  "asgard-migration" = {
    general = [{
      advertise_host_routes = true
      arp_flooding          = true
      description           = "Asgard Migration Bridge Domain"
      tenant                = "skunkworks"
      vrf                   = "prod"
      vrf_tenant            = "common"
    }]
    l3_configurations = [{
      associated_l3outs = [{
        l3out        = "prod"
        l3out_tenant = "common"
      }]
      subnets = [{
        gateway_ip = "10.92.102.1/24"
        scope = [{
          advertise_externally = true
        }]
      }]
      unicast_routing = true
    }]
  }
  "asgard-storage" = {
    general = [{
      advertise_host_routes = true
      arp_flooding          = true
      description           = "Asgard Storage Bridge Domain"
      tenant                = "skunkworks"
      vrf                   = "prod"
      vrf_tenant            = "common"
    }]
    l3_configurations = [{
      associated_l3outs = [{
        l3out        = "prod"
        l3out_tenant = "common"
      }]
      subnets = [{
        gateway_ip = "10.92.103.1/24"
        scope = [{
          advertise_externally = true
        }]
      }]
      unicast_routing = true
    }]
  }
}