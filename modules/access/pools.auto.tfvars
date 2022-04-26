vlan_pools = {
  "access" = {
    allocation_mode = "static"
    description     = "Marvel Access Static Pool"
    encap_blocks = {
      "0" = {
        description = "Asgard Temps"
        vlan_range  = "1101-1110"
      }
      "1" = {
        description = "Marvel Range"
        vlan_range  = "2200-2210"
      }
    }
  }
  "l3out" = {
    allocation_mode = "static"
    description     = "Marvel L3Out Static Pool"
    encap_blocks = {
      "0" = {
        description = "L3Outs"
        vlan_range  = "1004-1006"
      }
    }
  }
}