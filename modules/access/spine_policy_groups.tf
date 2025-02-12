/*_____________________________________________________________________________________________________________________

Spine Policy Group Variables
_______________________________________________________________________________________________________________________
*/
variable "spine_policy_groups" {
  default = {
    "default" = {
      annotation               = ""
      bfd_ipv4_policy          = "default"
      bfd_ipv6_policy          = "default"
      cdp_policy               = "default"
      copp_pre_filter          = "default"
      copp_spine_policy        = "default"
      description              = ""
      lldp_policy              = "default"
      name_alias               = ""
      usb_configuration_policy = "default"
    }
  }
  description = <<-EOT
  key - Name of the Leaf Policy Group.
  * annotation: A search keyword or term that is assigned to the Object. Tags allow you to group multiple objects by descriptive names. You can assign the same tag name to multiple objects and you can assign one or more tag names to a single object. 
  * bfd_ipv4_policy: The BFD IPv4 policy name.  Bidirectional Forwarding Detection (BFD) is used to provide sub-second failure detection times in the forwarding path between Cisco ACI fabric border leaf switches configured to support peering router connections.
  * bfd_ipv6_policy: The BFD IPv6 policy name.  Bidirectional Forwarding Detection (BFD) is used to provide sub-second failure detection times in the forwarding path between Cisco ACI fabric border leaf switches configured to support peering router connections.
  * cdp_policy: The CDP policy name.  CDP is used to obtain protocol addresses of neighboring devices and discover those devices. CDP is also be used to display information about the interfaces connecting to the neighboring devices. CDP is media- and protocol-independent, and runs on all Cisco-manufactured equipments including routers, bridges, access servers, and switches.
  * copp_pre_filter: The CoPP Pre-Filter name.  A CoPP prefilter profile is used on spine and leaf switches to filter access to authentication services based on specified sources and TCP ports to protect against DDoS attacks. When deployed on a switch, control plane traffic is denied by default. Only the traffic specified in the CoPP prefilter profile is permitted.
  * copp_spine_policy: The Spine CoPP policy name.  Control Plane Policing (CoPP) protects the control plane, which ensures network stability, reachability, and packet delivery.
  * description: Description to add to the Object.  The description can be up to 128 alphanumeric characters.
  * lldp_policy: The LLDP policy name.  LLDP uses the logical link control (LLC) services to transmit and receive information to and from other LLDP agents.
  * name_alias: A changeable name for a given object. While the name of an object, once created, cannot be changed, the name_alias is a field that can be changed.
  * usb_configuration_policy: The USB configuration policy name.  The USB configuration policy can disable the USB port on a Cisco ACI-mode switch to prevent someone booting the switch from a USB image that contains malicious code.
  EOT
  type = map(object(
    {
      annotation               = optional(string)
      bfd_ipv4_policy          = optional(string)
      bfd_ipv6_policy          = optional(string)
      cdp_policy               = optional(string)
      copp_pre_filter          = optional(string)
      copp_spine_policy        = optional(string)
      description              = optional(string)
      lldp_policy              = optional(string)
      name_alias               = optional(string)
      usb_configuration_policy = optional(string)
    }
  ))
}


/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "infraSpineAccNodePGrp"
 - Distinguished Name: "uni/infra/funcprof/spaccnodepgrp-{name}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Policy Groups: {name}

BFD IPv4 Policy
 - Class: "bfdIpv4InstPol"
 - Distinguished Name: "uni/infra/bfdIpv4Inst-{bfd_ipv4_policy}"
BFD IPv6 Policy
 - Class: "bfdIpv6InstPol"
 - Distinguished Name: "uni/infra/bfdIpv6Inst-{bfd_ipv6_policy}"
CDP Policy
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-{cdp_policy}"
CoPP Spine Policy
 - Class: "coppSpineProfile"
 - Distinguished Name: "uni/infra/coppspinep-{copp_spine_policy}"
CoPP Pre-Filter
 - Class: "iaclSpineProfile"
 - Distinguished Name: "uni/infra/iaclspinep-{copp_pre_filter}"
LLDP Policy
 - Class: "lldpIfPol"
 - Distinguished Name: "uni/infra/lldpIfP-{lldp_policy}"
_______________________________________________________________________________________________________________________
*/
resource "aci_spine_switch_policy_group" "spine_policy_groups" {
  depends_on = [
    aci_cdp_interface_policy.cdp_interface_policies,
    aci_lldp_interface_policy.lldp_interface_policies
  ]
  for_each                                     = local.spine_policy_groups
  annotation                                   = each.value.annotation != "" ? each.value.annotation : var.annotation
  description                                  = each.value.description
  name                                         = each.key
  name_alias                                   = each.value.name_alias
  relation_infra_rs_iacl_spine_profile         = "uni/infra/iaclspinep-${each.value.copp_pre_filter}"
  relation_infra_rs_spine_bfd_ipv4_inst_pol    = "uni/infra/bfdIpv4Inst-${each.value.bfd_ipv4_policy}"
  relation_infra_rs_spine_bfd_ipv6_inst_pol    = "uni/infra/bfdIpv6Inst-${each.value.bfd_ipv6_policy}"
  relation_infra_rs_spine_copp_profile         = "uni/infra/coppspinep-${each.value.copp_spine_policy}"
  relation_infra_rs_spine_p_grp_to_cdp_if_pol  = aci_cdp_interface_policy.cdp_interface_policies[each.value.cdp_policy].id
  relation_infra_rs_spine_p_grp_to_lldp_if_pol = aci_lldp_interface_policy.lldp_interface_policies[each.value.lldp_policy].id
}
