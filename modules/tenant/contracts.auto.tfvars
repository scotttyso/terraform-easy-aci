contracts = {
  "app_filter" = {
    contract_type = "standard"
    description   = "value"
    filters = [
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