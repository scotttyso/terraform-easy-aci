leaf_port_group_access   = {}
leaf_port_group_breakout = {}
leaf_port_group_bundle = {
  "thorA" = {
    aaep_policy                    = "trunkAep"
    annotation                     = "value"
    cdp_interface_policy           = "cdpEnabled"
    lacp_interface_policy          = "lacpActive"
    lldp_interface_policy          = "lldpEnabled"
    mcp_interface_policy           = "mcpEnabled"
    monitoring_policy              = "default"
    spanning_tree_interface_policy = "default"
  }
  "thorB" = {
    aaep_policy                    = "trunkAep"
    annotation                     = "value"
    cdp_interface_policy           = "cdpEnabled"
    lacp_interface_policy          = "lacpActive"
    lldp_interface_policy          = "lldpEnabled"
    mcp_interface_policy           = "mcpEnabled"
    monitoring_policy              = "default"
    spanning_tree_interface_policy = "default"
  }
}