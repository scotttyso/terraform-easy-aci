aaep_policies = {
  "l3out" = {
    description      = "Auto Trunk AAEP"
    layer3_domains = ["l3out"]
  }
  "trunkAep" = {
    description      = "Auto Trunk AAEP"
    physical_domains = ["access"]
  }
}
error_disabled_recovery_policy = {}
mcp_instance_policy            = {}
global_qos_class               = {}