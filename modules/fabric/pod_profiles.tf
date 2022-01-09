variable "pod_policy_groups" {
  default = {
    "default" = {
      alias                      = ""
      bgp_route_reflector_policy = "default"
      coop_group_policy          = "default"
      date_time_policy           = "default"
      description                = ""
      isis_policy                = "default"
      macsec_policy              = "default"
      management_access_policy   = "default"
      snmp_policy                = "default"
      tags                       = ""
    }
  }
  description = <<-EOT
  key - Name of the Pod Policy Group
  * alias: A changeable name for a given object. While the name of an object, once created, cannot be changed, the alias is a field that can be changed.
  * bgp_route_reflector_policy: Name of the BGP Route Reflector Policy.
  * coop_group_policy: Name of the COOP Group Policy.
  * date_time_policy: Name of the Data and Time Policy.
  * description: Description to add to the Object.  The description can be up to 128 alphanumeric characters.
  * isis_policy: Name of the ISIS Policy.
  * macsec_policy: Name of the MACSec Policy.
  * management_access_policy: Name of the Management Access Policy.
  * snmp_policy: Name of the SNMP Policy.
  * tags: A search keyword or term that is assigned to the Object. Tags allow you to group multiple objects by descriptive names. You can assign the same tag name to multiple objects and you can assign one or more tag names to a single object.
  EOT
  type = map(object(
    {
      alias                      = optional(string)
      bgp_route_reflector_policy = optional(string)
      coop_group_policy          = optional(string)
      date_time_policy           = optional(string)
      description                = optional(string)
      isis_policy                = optional(string)
      macsec_policy              = optional(string)
      management_access_policy   = optional(string)
      snmp_policy                = optional(string)
      tags                       = optional(string)
    }
  ))
}
/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "fabricPodPGrp"
 - Distinguished Name: "uni/fabric/funcprof/podpgrp-{policy_group}"
GUI Location:
 - Fabric > Fabric Policies > Pods > Policy Groups: {policy_group}
_______________________________________________________________________________________________________________________
*/
resource "aci_rest" "pod_policy_groups" {
  provider   = netascode
  for_each   = local.pod_policy_groups
  dn         = "uni/fabric/funcprof/podpgrp-${each.key}"
  class_name = "fabricPodPGrp"
  content = {
    descr = each.value.description
    name  = each.key
  }
  child {
    rn         = "rsTimePol"
    class_name = "fabricRsTimePol"
    content = {
      tnDatetimePolName = "${each.value.date_time_policy}"
    }
  }
  child {
    rn         = "rsPodPGrpIsisDomP"
    class_name = "fabricRsPodPGrpIsisDomP"
    content = {
      tnIsisDomPolName = "${each.value.isis_policy}"
    }
  }
  child {
    rn         = "rsPodPGrpCoopP"
    class_name = "fabricRsPodPGrpCoopP"
    content = {
      tnCoopPolName = "${each.value.coop_group_policy}"
    }
  }
  child {
    rn         = "rsPodPGrpBGPRRP"
    class_name = "fabricRsPodPGrpBGPRRP"
    content = {
      tnBgpInstPolName = "${each.value.bgp_route_reflector_policy}"
    }
  }
  child {
    rn         = "rsCommPol"
    class_name = "fabricRsCommPol"
    content = {
      tnCommPolName = "${each.value.management_access_policy}"
    }
  }
  child {
    rn         = "rsSnmpPol"
    class_name = "fabricRsSnmpPol"
    content = {
      tnSnmpPolName = "${each.value.snmp_policy}"
    }
  }
  child {
    rn         = "rsmacsecPol"
    class_name = "fabricRsMacsecPol"
    content = {
      tnMacsecFabIfPolName = "${each.value.macsec_policy}"
    }
  }
}


# resource "aci_rest" "pod_policy_groups" {
#   for_each = local.pod_profiles
#   path       = "/api/node/mo/uni/fabric/funcprof/podpgrp-${each.key}.json"
#   class_name = "fabricPodPGrp"
#   payload    = <<EOF
# {
#   "fabricPodPGrp": {
#     "attributes": {
#       "descr": "${each.value.description}",
#       "dn": "uni/fabric/funcprof/podpgrp-${each.key}",
#       "name": "${each.key}"
#     },
#     "children": [
#       {
#         "fabricRsTimePol": {
#           "attributes": {
#             "tnDatetimePolName": "${each.value.date_time_policy}"
#           },
#           "children": []
#         }
#       },
#       {
#         "fabricRsPodPGrpIsisDomP": {
#           "attributes": {
#             "tnIsisDomPolName": "${each.value.isis_policy}"
#           },
#           "children": []
#         }
#       },
#       {
#         "fabricRsPodPGrpCoopP": {
#           "attributes": {
#             "tnCoopPolName": "${each.value.coop_group_policy}"
#           },
#           "children": []
#         }
#       },
#       {
#       "fabricRsPodPGrpBGPRRP": {
#       "attributes": {
#         "tnBgpInstPolName": "${each.value.bgp_route_reflector_policy}"
#       },
#       "children": []
#       }
#       },
#       {
#         "fabricRsCommPol": {
#           "attributes": {
#             "tnCommPolName": "${each.value.management_access_policy}"
#           },
#           "children": []
#         }
#       },
#       {
#         "fabricRsSnmpPol": {
#           "attributes": {
#             "tnSnmpPolName": "${each.value.snmp_policy}"
#           },
#           "children": []
#         }
#       },
#       {
#         "fabricRsMacsecPol": {
#           "attributes": {
#             "tnMacsecFabIfPolName": "${each.value.macsec_policy}"
#           },
#           "children": []
#         }
#       }
#     ]
#   }
# }
#   EOF
# }

variable "pod_profiles" {
  default = {
    "default" = {
      alias       = ""
      description = ""
      pod_selectors = [
        {
          name              = "default"
          pod_selector_type = "ALL"
          policy_group      = "default"
        }
      ]
      tags = ""
    }
  }
  description = <<-EOT
  key - Name of the Pod Profile.
  * alias: A changeable name for a given object. While the name of an object, once created, cannot be changed, the alias is a field that can be changed.
  * bgp_route_reflector_policy: Name of the BGP Route Reflector Policy.
  * description: Description to add to the Object.  The description can be up to 128 alphanumeric characters.
  * pod_selectors: Attributes for a Pod Selector.
    - name: Name of the Pod Selector Group.
    - pod_selector_type:
      * ALL: Select all Pods in the Fabric.
      * range: Select Specific Pods in the Fabric.
    - pods: if pod_selector_type is set to range, enter the starting and ending pods to add to the selector group. 
      i.e. [{staring_pod_id}, {ending_pod_id}]
    - policy_group: Name of the Pod Policy Group to add to the Selector Group.
  * tags: A search keyword or term that is assigned to the Object. Tags allow you to group multiple objects by descriptive names. You can assign the same tag name to multiple objects and you can assign one or more tag names to a single object.
  EOT
  type = map(object(
    {
      alias       = optional(string)
      description = optional(string)
      pod_selectors = list(object(
        {
          name              = optional(string)
          pod_selector_type = optional(string)
          pods              = optional(list(string))
          policy_group      = optional(string)
        }
      ))
      tags = optional(string)
    }
  ))
}
/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "fabricPodP"
 - Distinguished Name: "uni/fabric/funcprof/podpgrp-{pod_profile}"
GUI Location:
 - Fabric > Fabric Policies > Pods > Profiles > Pod Profile {pod_profile}
_______________________________________________________________________________________________________________________
*/
resource "aci_rest" "pod_profiles" {
  provider = netascode
  depends_on = [
    aci_rest.pod_policy_groups
  ]
  for_each   = local.pod_profiles
  dn         = "uni/fabric/podprof-${each.key}"
  class_name = "fabricPodP"
  content = {
    annotation = each.value.tags
    descr      = each.value.description
    name       = each.key
    nameAlias  = each.value.alias
  }
}

/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "fabricPodS"
 - Distinguished Name: "uni/fabric/podprof-${pod_profile}/pods-${name}-typ-ALL"
GUI Location:
 - Fabric > Fabric Policies > Pods > Profiles > Pod Profile {pod_profile} > Pod Selectors
_______________________________________________________________________________________________________________________
*/
resource "aci_rest" "pod_profile_selectors_all" {
  provider = netascode
  depends_on = [
    aci_rest.pod_policy_groups,
    aci_rest.pod_profiles
  ]
  for_each   = { for k, v in local.pod_profile_selectors : k => v if v.pod_selector_type == "ALL" }
  dn         = "uni/fabric/podprof-${each.key}/pods-${each.value.name}-typ-ALL"
  class_name = "fabricPodS"
  content = {
    name = each.value.name
    type = each.value.pod_selector_type
  }
  child {
    rn         = "rspodPGrp"
    class_name = "fabricRsPodPGrp"
    content = {
      tDn = "uni/fabric/funcprof/podpgrp-${each.key}"
    }
  }
}

/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "fabricPodS"
 - Distinguished Name: "uni/fabric/podprof-${pod_profile}/pods-${name}-typ-range"
GUI Location:
 - Fabric > Fabric Policies > Pods > Profiles > Pod Profile {pod_profile} > Pod Selectors
_______________________________________________________________________________________________________________________
*/
resource "aci_rest" "pod_profile_selectors_range" {
  provider = netascode
  depends_on = [
    aci_rest.pod_policy_groups,
    aci_rest.pod_profiles
  ]
  for_each   = { for k, v in local.pod_profile_selectors : k => v if v.pod_selector_type == "range" }
  dn         = "uni/fabric/podprof-${each.key}/pods-${each.value.name}-typ-range"
  class_name = "fabricPodS"
  content = {
    name = each.value.name
    type = each.value.pod_selector_type
  }
  child {
    rn = length(
      each.value.pods
    ) > 1 ? "podblk-${element(each.value.pods, 0)}_${element(each.value.pods, 1)}" : "podblk-${element(each.value.pods, 0)}"
    class_name = "fabricPodBlk"
    content = {
      from_ = element(each.value.pods, 0)
      to_   = length(each.value.pods) > 1 ? element(each.value.pods, 1) : element(each.value.pods, 0)
    }
  }
  child {
    rn         = "rspodPGrp"
    class_name = "fabricRsPodPGrp"
    content = {
      tDn = "uni/fabric/funcprof/podpgrp-${each.key}"
    }
  }
}

# resource "aci_rest" "pod_profiles" {
#   depends_on = [
#     aci_rest.pod_policy_groups
#   ]
#   for_each   = local.pod_profiles
#   path       = "/api/node/mo/uni/fabric/podprof-${each.key}/pods-default-typ-ALL/rspodPGrp.json"
#   class_name = "fabricRsPodPGrp"
#   payload    = <<EOF
# {
#   "fabricRsPodPGrp": {
#     "attributes": {
#       "tDn": "uni/fabric/funcprof/podpgrp-${each.key}",
#     },
#     "children": []
#   }
# }
#     EOF
# }
