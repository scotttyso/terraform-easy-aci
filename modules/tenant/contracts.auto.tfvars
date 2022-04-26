contracts = {
  "app_filter" = {
    contract_type = "standard"
    description   = "value"
    filters = [
      {
        action = "deny"
        name   = "ssh_filter"
        tenant = "common"
      },
      {
        action = "permit"
        name   = "default"
        tenant = "common"
      }
    ]
    log_packets          = true
    reverse_filter_ports = false
    scope                = "global"
    tenant               = "common"
  }
}