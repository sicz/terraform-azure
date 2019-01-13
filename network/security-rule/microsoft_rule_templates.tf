# https://support.microsoft.com/cs-cz/help/832017/service-overview-and-network-port-requirements-for-windows
locals {
  microsoft_rule_templates = {
    ms_ad_dc_tcp_all = {
      description             = "Active Directory Domain Controller"
      protocol                = "Tcp"
      destination_port_ranges = "53,80,88,389,443,445,636,3268,3269,49152-65535"
    }

    ms_ad_dc_udp_all = {
      description             = "Active Directory Domain Controller"
      protocol                = "Udp"
      destination_port_ranges = "53,88,123,135,389"
    }

    ms_ad_dc_ldap_all = {
      description             = "Active Directory Domain Controller LDAP(S)"
      protocol                = "Tcp"
      destination_port_ranges = "389,636,3268,3269"
    }

    ms_ad_dc_ldaps_all = {
      description             = "Active Directory Domain Controller LDAPS"
      protocol                = "Tcp"
      destination_port_ranges = "636,3269"
    }

    ms_ad_gc_ldap = {
      description             = "Active Directory Global Catalog LDAP"
      protocol                = "Tcp"
      destination_port_ranges = "3268"
    }

    ms_ad_gc_ldaps = {
      description             = "Active Directory Global Catalog LDAPS"
      protocol                = "Tcp"
      destination_port_ranges = "3269"
    }

    ms_rdp = {
      description             = "Microsoft Remote Desktop Protocol"
      protocol                = "Tcp"
      destination_port_ranges = "3389"
    }

    ms_sql = {
      description             = "Microsoft SQL Server"
      protocol                = "Tcp"
      destination_port_ranges = "1433"
    }

    ms_winrm = {
      description             = "Microsoft WinRM"
      protocol                = "Tcp"
      destination_port_ranges = "5986"
    }
  }
}
