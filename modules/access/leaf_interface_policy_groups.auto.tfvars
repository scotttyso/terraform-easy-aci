leaf_port_group_access   = {}
leaf_port_group_breakout = {}
leaf_port_group_bundle = {
  "coreL3Out" = {
    aaep_policy                    = "l3out"
    cdp_interface_policy           = "cdpEnabled"
    lacp_interface_policy          = "lacpActive"
    lldp_interface_policy          = "lldpEnabled"
    mcp_interface_policy           = "mcpEnabled"
    monitoring_policy              = "default"
    spanning_tree_interface_policy = "default"
  }
  "odinA" = {
    aaep_policy                    = "trunkAep"
    cdp_interface_policy           = "cdpEnabled"
    lacp_interface_policy          = "lacpActive"
    lldp_interface_policy          = "lldpEnabled"
    mcp_interface_policy           = "mcpEnabled"
    monitoring_policy              = "default"
    spanning_tree_interface_policy = "default"
  }
  "odinB" = {
    aaep_policy                    = "trunkAep"
    cdp_interface_policy           = "cdpEnabled"
    lacp_interface_policy          = "lacpActive"
    lldp_interface_policy          = "lldpEnabled"
    mcp_interface_policy           = "mcpEnabled"
    monitoring_policy              = "default"
    spanning_tree_interface_policy = "default"
  }
}