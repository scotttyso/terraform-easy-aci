bridge_domains = {
  "Apps" = {
    controller_type = "apic"
    general = [{
      description = "Apps Bridge Domain"
      tenant      = "prod"
      vrf         = "prod"
      vrf_tenant  = "common"
    }]
    l3_configurations = [{
      subnets = [{
        associated_l3outs = [{
          l3out        = "prod"
          l3out_tenant = "common"
        }]
        gateway_ip = "10.96.120.1/24"
        scope = [{
          advertise_externally = true
        }]
        subnet_control = [{}]
      }]
      unicast_routing = true
    }]
    troubleshooting_advanced = [{}]
  }
}