cdp_interface_policies = {
  "cdpEnabled" = {
    description = "CDP Enable Policy"
  }
}
global_qos_class      = {}
fc_interface_policies = {}
l2_interface_policies = {}
lacp_interface_policies = {
  "lacpActive" = {
    mode = "active"
  }
}
link_level_policies = {}
lldp_interface_policies = {
  "lldpEnabled" = {
    description    = "LLDP Rx/Tx Enbled"
    receive_state  = "enabled"
    transmit_state = "enabled"
  }
}
mcp_interface_policies = {
  "mcpEnabled" = {
    admin_state = "enabled"
  }
}
port_security_policies = {}
spanning_tree_interface_policies = {
  "default" = {
    bpdu_filter = "disabled"
    bpdu_guard  = "disabled"
  }
}