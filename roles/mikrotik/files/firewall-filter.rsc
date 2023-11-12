/ip firewall filter remove [/ip firewall filter find where dynamic=no]
/ip firewall filter
add action=accept chain=input comment="defconf: accept established,related,untracked" connection-state=established,related,untracked
add action=drop chain=input comment="defconf: drop invalid" connection-state=invalid log=no
add action=drop chain=input comment="Drop all not coming from LAN - Garbage from the WAN" in-interface-list=!LAN
add action=accept chain=input comment="defconf: accept ICMP" in-interface-list=LAN protocol=icmp
add action=accept chain=input comment="defconf: accept to local loopback (for CAPsMAN)" dst-address=127.0.0.1
add action=accept chain=input connection-state=new dst-port=53 in-interface-list=LAN log=no protocol=udp
add action=accept chain=input connection-state=new dst-port=53 in-interface-list=LAN log=no protocol=tcp
add action=accept chain=input connection-state=new dst-port=67 in-interface-list=LAN log=no protocol=udp
add action=accept chain=input connection-state=new dst-port=5678 src-address=10.10.1.188 log=no protocol=udp comment="MikroTik discovery"
add action=accept chain=input connection-state=new dst-port=22,80,443 in-interface=VLAN300 log=no protocol=tcp
add action=log chain=input log=yes log-prefix="INPUT (BEFORE) DROP: "
add action=drop chain=input
add action=drop chain=forward in-interface=ether1 src-address-list=not_in_internet
add action=drop chain=forward comment="IoT: No Internet" src-address-list=no_internet_access
add action=drop chain=forward comment="defconf: drop invalid" connection-state=invalid log=no
add action=drop chain=forward comment="defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat connection-state=new in-interface-list=WAN
add action=fasttrack-connection chain=forward comment="defconf: fasttrack" connection-state=established,related hw-offload=yes
add action=accept chain=forward comment="defconf: accept established,related, untracked" connection-state=established,related,untracked
add action=accept chain=forward comment="foward ICMP" protocol=icmp
add action=accept chain=forward connection-state=new comment="Allow VLAN200 to VLAN100" in-interface=VLAN200 out-interface=VLAN100
add action=accept chain=forward connection-state=new comment="Allow VLAN300 to LAN" in-interface=VLAN300 out-interface-list=LAN
add action=accept chain=forward connection-state=new comment="Allow 'allowed_to_services' to VLAN200 media services" dst-address=10.10.2.12 dst-port=80,443 src-address-list=allowed_to_services protocol=tcp
add action=accept chain=forward connection-state=new comment="Allow access to the Internet" in-interface-list=LAN out-interface-list=WAN
add action=log chain=forward log=yes log-prefix="FORWARD (BEFORE) DROP: "
add action=drop chain=forward
add action=accept chain=output comment="defconf: accept established,related, untracked" connection-state=established,related,untracked
add action=accept chain=output comment="output ICMP" protocol=icmp
add action=accept chain=output connection-state=new dst-port=53 protocol=udp 
add action=accept chain=output connection-state=new dst-port=53 protocol=tcp
add action=accept chain=output connection-state=new dst-port=443 protocol=tcp out-interface-list=WAN
add action=accept chain=output connection-state=new dst-port=123 protocol=udp out-interface-list=WAN
add action=accept chain=output connection-state=new dst-port=123 protocol=tcp out-interface-list=WAN src-port=123
add action=log chain=output log=yes log-prefix="OUTPUT (BEFORE) DROP: "
add action=drop chain=output