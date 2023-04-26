nodes = {
    dc1-spine1 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 400
        y = 600
    }
    dc1-spine2 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 600
        y = 600
    }
    dc1-leaf1 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 200
        y = 800
    }
    dc1-leaf2 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 400
        y = 800
    }
    dc1-leaf3 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 600
        y = 800
    }
    dc1-leaf4 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 800
        y = 800
    }
    dc1-abgw1 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 400
        y = 200
    }
    dc1-abgw2 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 600
        y = 400
    }
    dc2-vbgw1 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 1400
        y = 200
    }
    dc2-vbgw2 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 1600
        y = 400
    }
    dc1-vrf1-net1-host1 = {
        nodedefinition = "ubuntu"
        x = 200
        y = 1000
        configuration = <<-EOT
#cloud-config
hostname: dc1-vrf1-net1-host1
manage_etc_hosts: True
system_info:
  default_user:
    name: cisco
password: cisco
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
   - your-ssh-pubkey-line-goes-here
write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    append: false
    content: |
      network:
        version: 2
        ethernets:
          ens2:
            dhcp4: false
            addresses:
              - 10.67.53.146/28
            gateway4: 10.67.53.145
            nameservers:
              addresses:
                - 171.70.168.183
                - 173.37.87.157
          ens3:
            dhcp4: false
          ens4:
            dhcp4: false
        bonds:
          bond0:
            interfaces:
              - ens3
              - ens4
            parameters:
              mode: 802.3ad
              lacp-rate: fast
              mii-monitor-interval: 100
        vlans:
          vlan.11:
            id: 11
            link: bond0
            addresses:
              - 192.168.11.2/24
            routes:
              - to: 192.168.0.0/16
                via: 192.168.11.1
                metric: 3
runcmd:
 - ethtool -s ens3 autoneg off speed 1000 duplex full
 - ethtool -s ens4 autoneg off speed 1000 duplex full
 - netplan apply
EOT
    }
    dc1-vrf1-net2-host1 = {
        nodedefinition = "ubuntu"
        x = 400
        y = 1000
        configuration = <<-EOT
#cloud-config
hostname: dc1-vrf1-net2-host1
manage_etc_hosts: True
system_info:
  default_user:
    name: cisco
password: cisco
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
   - your-ssh-pubkey-line-goes-here
write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    append: false
    content: |
      network:
        version: 2
        ethernets:
          ens2:
            dhcp4: false
            addresses:
              - 10.67.53.149/28
            gateway4: 10.67.53.145
            nameservers:
              addresses:
                - 171.70.168.183
                - 173.37.87.157
          ens3:
            dhcp4: false
          ens4:
            dhcp4: false
        bonds:
          bond0:
            interfaces:
              - ens3
              - ens4
            parameters:
              mode: 802.3ad
              lacp-rate: fast
              mii-monitor-interval: 100
        vlans:
          vlan.12:
            id: 12
            link: bond0
            addresses:
              - 192.168.12.2/24
            routes:
              - to: 192.168.0.0/16
                via: 192.168.12.1
                metric: 3
runcmd:
 - ethtool -s ens3 autoneg off speed 1000 duplex full
 - ethtool -s ens4 autoneg off speed 1000 duplex full
 - netplan apply
EOT
    }
    dc1-vrf1-net1-host2 = {
        nodedefinition = "ubuntu"
        x = 600
        y = 1000
        configuration = <<-EOT
#cloud-config
hostname: dc1-vrf1-net1-host2
manage_etc_hosts: True
system_info:
  default_user:
    name: cisco
password: cisco
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
   - your-ssh-pubkey-line-goes-here
write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    append: false
    content: |
      network:
        version: 2
        ethernets:
          ens2:
            dhcp4: false
            addresses:
              - 10.67.53.147/28
            gateway4: 10.67.53.145
            nameservers:
              addresses:
                - 171.70.168.183
                - 173.37.87.157
          ens3:
            dhcp4: false
          ens4:
            dhcp4: false
        bonds:
          bond0:
            interfaces:
              - ens3
              - ens4
            parameters:
              mode: 802.3ad
              lacp-rate: fast
              mii-monitor-interval: 100
        vlans:
          vlan.11:
            id: 11
            link: bond0
            addresses:
              - 192.168.11.3/24
            routes:
              - to: 192.168.0.0/16
                via: 192.168.11.1
                metric: 3
runcmd:
 - ethtool -s ens3 autoneg off speed 1000 duplex full
 - ethtool -s ens4 autoneg off speed 1000 duplex full
 - netplan apply
EOT
    }
    dc1-vrf2-net1-host1 = {
        nodedefinition = "ubuntu"
        x = 800
        y = 1000
        configuration = <<-EOT
#cloud-config
hostname: dc1-vrf2-net1-host1
manage_etc_hosts: True
system_info:
  default_user:
    name: cisco
password: cisco
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
   - your-ssh-pubkey-line-goes-here
write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    append: false
    content: |
      network:
        version: 2
        ethernets:
          ens2:
            dhcp4: false
            addresses:
              - 10.67.53.150/28
            gateway4: 10.67.53.145
            nameservers:
              addresses:
                - 171.70.168.183
                - 173.37.87.157
          ens3:
            dhcp4: false
          ens4:
            dhcp4: false
        bonds:
          bond0:
            interfaces:
              - ens3
              - ens4
            parameters:
              mode: 802.3ad
              lacp-rate: fast
              mii-monitor-interval: 100
        vlans:
          vlan.13:
            id: 13
            link: bond0
            addresses:
              - 192.168.13.2/24
            routes:
              - to: 192.168.0.0/16
                via: 192.168.13.1
                metric: 3
runcmd:
 - ethtool -s ens3 autoneg off speed 1000 duplex full
 - ethtool -s ens4 autoneg off speed 1000 duplex full
 - netplan apply
EOT
    }
    dc2-vrf1-net1-host1 = {
        nodedefinition = "ubuntu"
        x = 1400
        y = 1000
        configuration = <<-EOT
#cloud-config
hostname: dc2-vrf1-net1-host1
manage_etc_hosts: True
system_info:
  default_user:
    name: cisco
password: cisco
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
   - your-ssh-pubkey-line-goes-here
write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    append: false
    content: |
      network:
        version: 2
        ethernets:
          ens2:
            dhcp4: false
            addresses:
              - 10.67.53.148/28
            gateway4: 10.67.53.145
            nameservers:
              addresses:
                - 171.70.168.183
                - 173.37.87.157
          ens3:
            dhcp4: false
          ens4:
            dhcp4: false
        bonds:
          bond0:
            interfaces:
              - ens3
              - ens4
            parameters:
              mode: 802.3ad
              lacp-rate: fast
              mii-monitor-interval: 100
        vlans:
          vlan.11:
            id: 11
            link: bond0
            addresses:
              - 192.168.11.4/24
            routes:
              - to: 192.168.0.0/16
                via: 192.168.11.1
                metric: 3
runcmd:
 - ethtool -s ens3 autoneg off speed 1000 duplex full
 - ethtool -s ens4 autoneg off speed 1000 duplex full
 - netplan apply
EOT
    }
    dc2-vrf2-net1-host1 = {
        nodedefinition = "ubuntu"
        x = 1600
        y = 1000
        configuration = <<-EOT
#cloud-config
hostname: dc2-vrf2-net1-host1
manage_etc_hosts: True
system_info:
  default_user:
    name: cisco
password: cisco
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
   - your-ssh-pubkey-line-goes-here
write_files:
  - path: /etc/netplan/50-cloud-init.yaml
    append: false
    content: |
      network:
        version: 2
        ethernets:
          ens2:
            dhcp4: false
            addresses:
              - 10.67.53.151/28
            gateway4: 10.67.53.145
            nameservers:
              addresses:
                - 171.70.168.183
                - 173.37.87.157
          ens3:
            dhcp4: false
          ens4:
            dhcp4: false
        bonds:
          bond0:
            interfaces:
              - ens3
              - ens4
            parameters:
              mode: 802.3ad
              lacp-rate: fast
              mii-monitor-interval: 100
        vlans:
          vlan.13:
            id: 13
            link: bond0
            addresses:
              - 192.168.13.3/24
            routes:
              - to: 192.168.0.0/16
                via: 192.168.13.1
                metric: 3
runcmd:
 - ethtool -s ens3 autoneg off speed 1000 duplex full
 - ethtool -s ens4 autoneg off speed 1000 duplex full
 - netplan apply
EOT
    }
    wan = {
        nodedefinition = "nxosv9000"
        imagedefinition = "N9K-10-3-2-F"
        x = 1000
        y = 0
        configuration = <<-EOT
hostname WAN
feature bgp

no password strength-check
username admin password 5 $5$NMMAEC$RlM.yAQl18pda0uKw17uYZDATNljly9huqhltTNcQt.  role network-admin
no ip domain-lookup
no system default switchport

vlan 1

vrf context management
  ip route 0.0.0.0/0 10.66.209.65

interface Ethernet1/1
  description ** DC1-ABGW1 **
  no shutdown

interface Ethernet1/1.11
  description ** VRF1 Peering **
  encapsulation dot1q 11
  ip address 192.168.254.254/30
  no shutdown

interface Ethernet1/1.12
  description ** VRF2 Peering **
  encapsulation dot1q 12
  ip address 192.168.253.254/30
  no shutdown

interface Ethernet1/2
  description ** DC1-ABGW2 **
  no shutdown

interface Ethernet1/2.11
  description ** VRF1 Peering **
  encapsulation dot1q 11
  ip address 192.168.254.250/30
  no shutdown

interface Ethernet1/2.12
  description ** VRF2 Peering **
  encapsulation dot1q 12
  ip address 192.168.253.250/30
  no shutdown

interface Ethernet1/3
  description ** DC2-VBGW1 **
  no shutdown

interface Ethernet1/3.11
  description ** VRF1 Peering **
  encapsulation dot1q 11
  ip address 192.168.254.246/30
  no shutdown

interface Ethernet1/3.12
  description ** VRF2 Peering **
  encapsulation dot1q 12
  ip address 192.168.253.246/30
  no shutdown

interface Ethernet1/4
  description ** DC2-VBGW2 **
  no shutdown

interface Ethernet1/4.11
  description ** VRF1 Peering **
  encapsulation dot1q 11
  ip address 192.168.254.242/30
  no shutdown

interface Ethernet1/4.12
  description ** VRF2 Peering **
  encapsulation dot1q 12
  ip address 192.168.253.242/30
  no shutdown

interface Ethernet1/5

interface Ethernet1/6

interface Ethernet1/7

interface Ethernet1/8

interface Ethernet1/9

interface Ethernet1/10

interface Ethernet1/11

interface Ethernet1/12

interface Ethernet1/13

interface Ethernet1/14

interface Ethernet1/15

interface Ethernet1/16

interface Ethernet1/17

interface Ethernet1/18

interface Ethernet1/19

interface Ethernet1/20

interface Ethernet1/21

interface Ethernet1/22

interface Ethernet1/23

interface Ethernet1/24

interface Ethernet1/25

interface Ethernet1/26

interface Ethernet1/27

interface Ethernet1/28

interface Ethernet1/29

interface Ethernet1/30

interface Ethernet1/31

interface Ethernet1/32

interface Ethernet1/33

interface Ethernet1/34

interface Ethernet1/35

interface Ethernet1/36

interface Ethernet1/37

interface Ethernet1/38

interface Ethernet1/39

interface Ethernet1/40

interface Ethernet1/41

interface Ethernet1/42

interface Ethernet1/43

interface Ethernet1/44

interface Ethernet1/45

interface Ethernet1/46

interface Ethernet1/47

interface Ethernet1/48

interface Ethernet1/49

interface Ethernet1/50

interface Ethernet1/51

interface Ethernet1/52

interface Ethernet1/53

interface Ethernet1/54

interface Ethernet1/55

interface Ethernet1/56

interface Ethernet1/57

interface Ethernet1/58

interface Ethernet1/59

interface Ethernet1/60

interface Ethernet1/61

interface Ethernet1/62

interface Ethernet1/63

interface Ethernet1/64

interface mgmt0
  vrf member management
  ip address 10.66.209.73/28

interface loopback0
  ip address 192.168.255.255/32
icam monitor scale

line console
  exec-timeout 0
line vty
  exec-timeout 0
router bgp 65010
  bestpath as-path multipath-relax
  bestpath always-compare-med
  address-family ipv4 unicast
    network 192.168.255.255/32
    maximum-paths 4
  neighbor 192.168.254.253
    remote-as 65011
    address-family ipv4 unicast
      soft-reconfiguration inbound
  neighbor 192.168.254.249
    remote-as 65011
    address-family ipv4 unicast
      soft-reconfiguration inbound
  neighbor 192.168.254.245
    remote-as 65012
    address-family ipv4 unicast
      soft-reconfiguration inbound
  neighbor 192.168.254.241
    remote-as 65012
    address-family ipv4 unicast
      soft-reconfiguration inbound
  neighbor 192.168.253.253
    remote-as 65011
    address-family ipv4 unicast
      soft-reconfiguration inbound
  neighbor 192.168.253.249
    remote-as 65011
    address-family ipv4 unicast
      soft-reconfiguration inbound
  neighbor 192.168.253.245
    remote-as 65012
    address-family ipv4 unicast
      soft-reconfiguration inbound
  neighbor 192.168.253.241
    remote-as 65012
    address-family ipv4 unicast
      soft-reconfiguration inbound

no logging console
EOT
    }
    lab = {
        nodedefinition = "external_connector"
        configuration = "bridge0"
        x = 1000
        y = 900
    }
    oob-mgmt = {
        nodedefinition = "nxosv9000"
        imagedefinition = "N9K-10-3-2-F"
        x = 1000
        y = 700
        configuration = <<-EOT
hostname OOB-MGMT
feature interface-vlan
feature dhcp
feature sla sender

no password strength-check
username admin password 5 $5$EGKEOA$jNzlc8Cr0wzdsXRZiVo.D1qZJh1H8i321amB7mK5yx9  role network-admin
username cisco password 5 $5$HLFAPK$K.j7J6EtCu6rxZ7yVzZuAUHlX59VbRwvPzJ9mc/GnE4  role network-admin
username cisco passphrase  lifetime 99999 warntime 14 gracetime 3
no ip domain-lookup

ip route 0.0.0.0/0 10.67.29.1
vlan 1,101-103

service dhcp
ip dhcp relay
ipv6 dhcp relay
vrf context management

interface Vlan101
  no shutdown
  ip address 10.66.209.49/28
  ip dhcp relay address 10.67.29.36 

interface Vlan102
  no shutdown
  ip address 10.66.209.65/28
  ip dhcp relay address 10.67.29.36 

interface Vlan103
  no shutdown
  ip address 10.67.53.145/28

interface Ethernet1/1
  no switchport
  ip address 10.67.29.32/24
  ip arp 10.67.29.1 bc16.65bf.8efc
  no shutdown

interface Ethernet1/2
  description **DC1-SPINE1**
  switchport access vlan 101

interface Ethernet1/3
  description **DC1-SPINE2**
  switchport access vlan 101

interface Ethernet1/4
  description **DC1-LEAF1**
  switchport access vlan 101

interface Ethernet1/5
  description **DC1-LEAF2**
  switchport access vlan 101

interface Ethernet1/6
  description **DC1-LEAF3**
  switchport access vlan 101

interface Ethernet1/7
  description **DC1-LEAF4**
  switchport access vlan 101

interface Ethernet1/8
  description **DC1-ABGW1**
  switchport access vlan 101

interface Ethernet1/9
  description **DC1-ABGW2**
  switchport access vlan 101

interface Ethernet1/10

interface Ethernet1/11
  description **DC1-VRF1-NET1-HOST1**
  switchport access vlan 103

interface Ethernet1/12
  description **DC1-VRF1-NET2-HOST1**
  switchport access vlan 103

interface Ethernet1/13
  description **DC1-VRF1-NET1-HOST2**
  switchport access vlan 103

interface Ethernet1/14
  description **DC1-VRF2-NET1-HOST1**
  switchport access vlan 103

interface Ethernet1/15
  description **WAN**
  switchport access vlan 102

interface Ethernet1/16
  description **DC2-VBGW1**
  switchport access vlan 102

interface Ethernet1/17
  description **DC2-VBGW2**
  switchport access vlan 102

interface Ethernet1/18
  description **DC2-VRF1-NET1-HOST1**
  switchport access vlan 103

interface Ethernet1/19
  description **DC2-VRF2-NET1-HOST1**
  switchport access vlan 103

interface Ethernet1/20

interface Ethernet1/21

interface Ethernet1/22

interface Ethernet1/23

interface Ethernet1/24

interface Ethernet1/25

interface Ethernet1/26

interface Ethernet1/27

interface Ethernet1/28

interface Ethernet1/29

interface Ethernet1/30

interface Ethernet1/31

interface Ethernet1/32

interface Ethernet1/33

interface Ethernet1/34

interface Ethernet1/35

interface Ethernet1/36

interface Ethernet1/37

interface Ethernet1/38

interface Ethernet1/39

interface Ethernet1/40

interface Ethernet1/41

interface Ethernet1/42

interface Ethernet1/43

interface Ethernet1/44

interface Ethernet1/45

interface Ethernet1/46

interface Ethernet1/47

interface Ethernet1/48

interface Ethernet1/49

interface Ethernet1/50

interface Ethernet1/51

interface Ethernet1/52

interface Ethernet1/53

interface Ethernet1/54

interface Ethernet1/55

interface Ethernet1/56

interface Ethernet1/57

interface Ethernet1/58

interface Ethernet1/59

interface Ethernet1/60

interface Ethernet1/61

interface Ethernet1/62

interface Ethernet1/63

interface Ethernet1/64

interface mgmt0
  vrf member management
icam monitor scale

line console
  exec-timeout 0
line vty
  exec-timeout 0

ip sla 10
  icmp-echo 10.67.29.4
ip sla schedule 10 life forever start-time now
no logging console
EOT
    }
}

links = {
  ### DC1 SWITCH LINKS ###
  dc1-spine1-leaf1 = {
        node_a = "dc1-spine1"
        slot_a = 1
        node_b = "dc1-leaf1"
        slot_b = 1
  }
  dc1-spine1-leaf2 = {
        node_a = "dc1-spine1"
        slot_a = 2
        node_b = "dc1-leaf2"
        slot_b = 1
  }
  dc1-spine1-leaf3 = {
        node_a = "dc1-spine1"
        slot_a = 3
        node_b = "dc1-leaf3"
        slot_b = 1
  }
  dc1-spine1-leaf4 = {
        node_a = "dc1-spine1"
        slot_a = 4
        node_b = "dc1-leaf4"
        slot_b = 1
  }
  dc1-spine1-abgw1 = {
        node_a = "dc1-spine1"
        slot_a = 5
        node_b = "dc1-abgw1"
        slot_b = 1
  }
  dc1-spine1-abgw2 = {
        node_a = "dc1-spine1"
        slot_a = 6
        node_b = "dc1-abgw2"
        slot_b = 1
  }
  dc1-spine2-leaf1 = {
        node_a = "dc1-spine2"
        slot_a = 1
        node_b = "dc1-leaf1"
        slot_b = 2
  }
  dc1-spine2-leaf2 = {
        node_a = "dc1-spine2"
        slot_a = 2
        node_b = "dc1-leaf2"
        slot_b = 2
  }
  dc1-spine2-leaf3 = {
        node_a = "dc1-spine2"
        slot_a = 3
        node_b = "dc1-leaf3"
        slot_b = 2
  }
  dc1-spine2-leaf4 = {
        node_a = "dc1-spine2"
        slot_a = 4
        node_b = "dc1-leaf4"
        slot_b = 2
  }
  dc1-spine2-abgw1 = {
        node_a = "dc1-spine2"
        slot_a = 5
        node_b = "dc1-abgw1"
        slot_b = 2
  }
  dc1-spine2-abgw2 = {
        node_a = "dc1-spine2"
        slot_a = 6
        node_b = "dc1-abgw2"
        slot_b = 2
  }
  ### DC1 ABGW LINKS ###
  dc1-abgw1-abgw2-1 = {
        node_a = "dc1-abgw1"
        slot_a = 3
        node_b = "dc1-abgw2"
        slot_b = 3
  }
  dc1-abgw1-abgw2-2 = {
        node_a = "dc1-abgw1"
        slot_a = 4
        node_b = "dc1-abgw2"
        slot_b = 4
  }
  ### DC2 VBGW LINKS ###
  dc2-vbgw1-vbgw2-1 = {
        node_a = "dc2-vbgw1"
        slot_a = 3
        node_b = "dc2-vbgw2"
        slot_b = 3
  }
  dc2-vbgw1-vbgw2-2 = {
        node_a = "dc2-vbgw1"
        slot_a = 4
        node_b = "dc2-vbgw2"
        slot_b = 4
  }
  ### L2 DCI LINKS ###
  abgw1-vbgw2 = {
        node_a = "dc1-abgw1"
        slot_a = 5
        node_b = "dc2-vbgw1"
        slot_b = 5
  }
  abgw2-vbgw2 = {
        node_a = "dc1-abgw2"
        slot_a = 5
        node_b = "dc2-vbgw2"
        slot_b = 5
  }
  ### WAN LINKS ###
  dc1-abgw1-wan = {
        node_a = "dc1-abgw1"
        slot_a = 6
        node_b = "wan"
        slot_b = 1
  }
  dc1-abgw2-wan = {
        node_a = "dc1-abgw2"
        slot_a = 6
        node_b = "wan"
        slot_b = 2
  }
  dc2-vbgw1-wan = {
        node_a = "dc2-vbgw1"
        slot_a = 6
        node_b = "wan"
        slot_b = 3
  }
  dc2-vbgw2-wan = {
        node_a = "dc2-vbgw2"
        slot_a = 6
        node_b = "wan"
        slot_b = 4
  } 
  ### OOB MGMT LINKS ###
    lab-oob = {
        node_a = "lab"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 1
    }
    dc1-spine1-oob = {
        node_a = "dc1-spine1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 2
    }
    dc1-spine2-oob = {
        node_a = "dc1-spine2"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 3
    }
    dc1-leaf1-oob = {
        node_a = "dc1-leaf1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 4
    }
    dc1-leaf2-oob = {
        node_a = "dc1-leaf2"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 5
    }
    dc1-leaf3-oob = {
        node_a = "dc1-leaf3"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 6
    }
    dc1-leaf4-oob = {
        node_a = "dc1-leaf4"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 7
    }
    dc1-abgw1-oob = {
        node_a = "dc1-abgw1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 8
    }
    dc1-abgw2-oob = {
        node_a = "dc1-abgw2"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 9
    }
    dc1-v1-n1-h1-oob = {
        node_a = "dc1-vrf1-net1-host1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 11
    }
    dc1-v1-n2-h1-oob = {
        node_a = "dc1-vrf1-net2-host1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 12
    }
    dc1-v1-n1-h2-oob = {
        node_a = "dc1-vrf1-net1-host2"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 13
    }
    dc1-v2-n1-h1-oob = {
        node_a = "dc1-vrf2-net1-host1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 14
    }
    wan-oob = {
        node_a = "wan"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 15
    }
    dc2-vbgw1-oob = {
        node_a = "dc2-vbgw1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 16
    }
    dc2-vbgw2-oob = {
        node_a = "dc2-vbgw2"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 17
    }
    dc2-v1-n1-h1-oob = {
        node_a = "dc2-vrf1-net1-host1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 18
    }
    dc2-v2-n1-h1-oob = {
        node_a = "dc2-vrf2-net1-host1"
        slot_a = 0
        node_b = "oob-mgmt"
        slot_b = 19
    }
  ### DC1 HOST LINKS ###
    dc1-v1-n1-h1-leaf1 = {
        node_a = "dc1-vrf1-net1-host1"
        slot_a = 1
        node_b = "dc1-leaf1"
        slot_b = 7
    }
    dc1-v1-n1-h1-leaf2 = {
        node_a = "dc1-vrf1-net1-host1"
        slot_a = 2
        node_b = "dc1-leaf2"
        slot_b = 7
    }
    dc1-v1-n2-h1-leaf1 = {
        node_a = "dc1-vrf1-net2-host1"
        slot_a = 1
        node_b = "dc1-leaf1"
        slot_b = 8
    }
    dc1-v1-n2-h1-leaf2 = {
        node_a = "dc1-vrf1-net2-host1"
        slot_a = 2
        node_b = "dc1-leaf2"
        slot_b = 8
    }
    dc1-v1-n1-h2-leaf3 = {
        node_a = "dc1-vrf1-net1-host2"
        slot_a = 1
        node_b = "dc1-leaf3"
        slot_b = 7
    }
    dc1-v1-n1-h2-leaf4 = {
        node_a = "dc1-vrf1-net1-host2"
        slot_a = 2
        node_b = "dc1-leaf4"
        slot_b = 7
    }
    dc1-v2-n1-h1-leaf3 = {
        node_a = "dc1-vrf2-net1-host1"
        slot_a = 1
        node_b = "dc1-leaf3"
        slot_b = 8
    }
    dc1-v2-n1-h1-leaf4 = {
        node_a = "dc1-vrf2-net1-host1"
        slot_a = 2
        node_b = "dc1-leaf4"
        slot_b = 8
    }
  ### DC2 HOST LINKS ###
    dc2-v1-n1-h1-vbgw1 = {
        node_a = "dc2-vrf1-net1-host1"
        slot_a = 1
        node_b = "dc2-vbgw1"
        slot_b = 7
    }
    dc2-v1-n1-h1-vbgw2 = {
        node_a = "dc2-vrf1-net1-host1"
        slot_a = 2
        node_b = "dc2-vbgw2"
        slot_b = 7
    }
    dc2-v2-n1-h1-vbgw1 = {
        node_a = "dc2-vrf2-net1-host1"
        slot_a = 1
        node_b = "dc2-vbgw1"
        slot_b = 8
    }
    dc2-v2-n1-h1-vbgw2 = {
        node_a = "dc2-vrf2-net1-host1"
        slot_a = 2
        node_b = "dc2-vbgw2"
        slot_b = 8
    }
}