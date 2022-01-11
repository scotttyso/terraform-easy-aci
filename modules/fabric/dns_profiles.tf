variable "dns_profiles" {
  default = {
    default = {
      description           = ""
      dns_domains           = []
      dns_providers         = []
      ip_version_preference = "IPv4"
      management_epg        = "default"
      management_epg_type   = "oob"
    }
  }
  type = map(object(
    {
      description = optional(string)
      dns_domains = optional(list(object(
        {
          domain         = string
          default_domain = optional(string)
          description    = optional(string)
        }
      )))
      dns_providers = optional(list(object(
        {
          description  = optional(string)
          dns_provider = string
          preferred    = optional(string)
        }
      )))
      ip_version_preference = optional(string)
      management_epg        = optional(string)
      management_epg_type   = optional(string)
    }
  ))
}

/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "dnsProfile"
 - Distinguished Name: "uni/fabric/dnsp-{name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG
_______________________________________________________________________________________________________________________
*/
resource "aci_rest" "dns_profiles" {
  provider   = netascode
  for_each   = local.dns_profiles
  dn         = "/api/node/mo/uni/fabric/dnsp-${each.key}"
  class_name = "dnsProfile"
  content = {
    annotation      = each.value.tags != "" ? each.value.tags : var.tags
    descr           = each.value.description
    IPVerPreference = each.value.ip_version_preference
    name            = each.key
  }
  child {
    rn         = "rsProfileToEpg"
    class_name = "dnsRsProfileToEpg"
    content = {
      tDn = "uni/tn-mgmt/mgmtp-default/${each.value.management_epg_type}-${each.value.management_epg}"
    }
  }
}


/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "dnsProv"
 - Distinguished Name: "uni/fabric/dnsp-{name}/prov-[{dns_provider}]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > {name}: DNS Providers
_______________________________________________________________________________________________________________________
*/
resource "aci_rest" "dns_providers" {
  provider = netascode
  depends_on = [
    aci_rest.dns_profiles
  ]
  for_each   = local.dns_providers
  dn         = "/api/node/mo/uni/fabric/dnsp-${each.value.key1}/prov-[${each.value.dns_provider}]"
  class_name = "dnsProv"
  content = {
    addr       = each.value.dns_provider
    annotation = each.value.tags != "" ? each.value.tags : var.tags
    preferred  = each.value.preferred
  }
}


/*_____________________________________________________________________________________________________________________

API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-{name}/dom-[{domain}]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > {name}: DNS Domains
_______________________________________________________________________________________________________________________
*/
resource "aci_rest" "dns_domains" {
  provider = netascode
  depends_on = [
    aci_rest.dns_profiles
  ]
  for_each   = local.dns_domains
  dn         = "/api/node/mo/uni/fabric/dnsp-${each.value.key1}/dom-[${each.value.domain}]"
  class_name = "dnsDomain"
  content = {
    annotation = each.value.tags != "" ? each.value.tags : var.tags
    descr      = each.value.description
    isDefault  = each.value.default_domain
    name       = each.value.domain
  }
}
