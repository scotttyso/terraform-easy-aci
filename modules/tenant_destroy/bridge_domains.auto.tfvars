bridge_domains = {
  "Apps" = {
    controller_type = "apic"
    general = [{
      arp_flooding = true
      description  = "Apps Bridge Domain"
      tenant       = "destroy"
      vrf          = "prod"
      vrf_tenant   = "common"
    }]
    l3_configurations = [{
      associated_l3outs = [{
        l3out        = "prod"
        l3out_tenant = "common"
      }]
      subnets = [{
        gateway_ip = "10.88.106.1/24"
        scope = [{
          advertise_externally = true
        }]
      }]
      unicast_routing = true
    }]
  }
}