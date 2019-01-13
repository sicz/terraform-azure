locals {
  protocol_rule_templates = {
    dns = {
      description             = "DNS"
      protocol                = "*"
      destination_port_ranges = "53"
    }

    dynamic_tcp_ports = {
      description             = "Dynamic TCP ports"
      protocol                = "Tcp"
      destination_port_ranges = "49152-65535"
    }

    http = {
      description             = "HTTP"
      protocol                = "Tcp"
      destination_port_ranges = "80"
    }

    https = {
      description             = "HTTPS"
      protocol                = "Tcp"
      destination_port_ranges = "443"
    }

    imap = {
      description             = "IMAP"
      protocol                = "Tcp"
      destination_port_ranges = "143"
    }

    imaps = {
      description             = "IMAPS"
      protocol                = "Tcp"
      destination_port_ranges = "993"
    }

    kerberos = {
      description             = "Kerberos"
      protocol                = "*"
      destination_port_ranges = "88"
    }

    ldap = {
      description             = "LDAP"
      protocol                = "Tcp"
      destination_port_ranges = "389"
    }

    ldap_udp = {
      description             = "LDAP over UDP"
      protocol                = "Udp"
      destination_port_ranges = "389"
    }

    ldaps = {
      description             = "LDAPS"
      protocol                = "Tcp"
      destination_port_ranges = "636"
    }

    ntp = {
      description             = "NTP"
      protocol                = "Udp"
      destination_port_ranges = "123"
    }

    rpc = {
      description             = "RPC Location Service"
      protocol                = "Tcp"
      destination_port_ranges = "135"
    }

    smtp = {
      description             = "SMTP"
      protocol                = "Tcp"
      destination_port_ranges = "25"
    }

    smtp_submission = {
      description             = "SMTP Submission"
      protocol                = "Tcp"
      destination_port_ranges = "587"
    }

    smb = {
      description             = "CIFS/SMB"
      protocol                = "Tcp"
      destination_port_ranges = "445"
    }

    ssh = {
      description             = "SSH"
      protocol                = "Tcp"
      destination_port_ranges = "22"
    }
  }
}
