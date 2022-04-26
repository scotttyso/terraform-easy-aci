leaf_profiles = {
  "101" = {
    description      = "Marvel Leaf 101"
    interfaces = {
      "1/50" = {
        interface_policy_group = "odinA"
        port_type              = "vpc"
        selector_description   = "odin-ucs-a-eth1/53"
        sub_port               = false
      }
      "1/51" = {
        interface_policy_group = "odinB"
        port_type              = "vpc"
        selector_description   = "odin-ucs-b-eth1/53"
        sub_port               = false
      }
      "1/52" = {
        interface_policy_group = "coreL3Out"
        port_type              = "vpc"
        selector_description   = "143b-core01-eth1/19"
        sub_port               = false
      }
    }
    leaf_policy_group = "default"
    monitoring_policy = "default"
    name              = "leaf101"
    node_type         = "unspecified"
    pod_id            = 1
    role              = "leaf"
    serial            = "FDO25161HAF"
    two_slot_leaf     = false
  }
  "102" = {
    description      = "Marvel Leaf 102"
    interfaces = {
      "1/50" = {
        interface_policy_group = "odinA"
        port_type              = "vpc"
        selector_description   = "odin-ucs-a-eth1/54"
        sub_port               = false
      }
      "1/51" = {
        interface_policy_group = "odinB"
        port_type              = "vpc"
        selector_description   = "odin-ucs-b-eth1/54"
        sub_port               = false
      }
      "1/52" = {
        interface_policy_group = "coreL3Out"
        port_type              = "vpc"
        selector_description   = "143c-core02-eth1/19"
        sub_port               = false
      }
    }
    leaf_policy_group = "default"
    monitoring_policy = "default"
    name              = "leaf102"
    node_type         = "unspecified"
    pod_id            = 1
    role              = "leaf"
    serial            = "FDO25161HD1"
    two_slot_leaf     = false
  }
}