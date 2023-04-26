nodes = {
    dc1-spine1 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 200
        y = 200
    }
    dc1-spine2 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 300
        y = 300
    }
    dc1-leaf1 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 100
        y = 300
    }
    dc1-leaf2 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 200
        y = 300
    }
    dc1-leaf3 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 300
        y = 300
    }
    dc1-leaf4 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 400
        y = 300
    }
    dc1-abgw1 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 200
        y = 100
    }
    dc1-abgw2 = {
        nodedefinition = "nxosv9000poap"
        imagedefinition = "N9K-10-3-2-F2"
        x = 300
        y = 100
    }
    lab = {
        nodedefinition = "external_connector"
        configuration = "bridge0"
        x = 500
        y = 700
    }
    oob-mgmt = {
        nodedefinition = "nxosv9000"
        imagedefinition = "N9K-10-3-2-F"
        x = 500
        y = 500
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
  description **DC1-ABGW2**
  switchport access vlan 101

interface Ethernet1/11
  description **DC1-VRF1-NET1-HOST1**
  switchport access vlan 103

interface Ethernet1/12
  description **DC1-VRF1-NET1-HOST2**
  switchport access vlan 103

interface Ethernet1/13
  description **DC1-VRF1-NET2-HOST1**
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
    lab-oob = {
        node_a = "lab"
        slot_a = "0"
        node_b = "oob-mgmt"
        slot_b = "1"
    }
}