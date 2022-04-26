filters = {
  "ssh_filter" = {
    description = "SSH Protocol"
    filter_entries = [
      {
        destination_port_from = "22"
        destination_port_to   = "22"
        ethertype             = "ip"
        ip_protocol           = "tcp"
        name                  = "ssh"
        stateful              = true
      }
    ]
    scope  = "global"
    tenant = "common"
  }
}