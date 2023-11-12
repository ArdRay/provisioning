/ip firewall address-list remove [/ip firewall address-list find]
/ip firewall address-list
add address=10.10.1.1 list=MGMT_Interfaces
add address=10.10.2.1 list=MGMT_Interfaces
add address=10.10.3.1 list=MGMT_Interfaces
add address=0.0.0.0/8 comment=RFC6890 list=not_in_internet
add address=169.254.0.0/16 comment=RFC6890 list=not_in_internet
add address=127.0.0.0/8 comment=RFC6890 list=not_in_internet
add address=224.0.0.0/4 comment=Multicast list=not_in_internet
add address=198.18.0.0/15 comment=RFC6890 list=not_in_internet
add address=192.0.0.0/24 comment=RFC6890 list=not_in_internet
add address=192.0.2.0/24 comment=RFC6890 list=not_in_internet
add address=198.51.100.0/24 comment=RFC6890 list=not_in_internet
add address=203.0.113.0/24 comment=RFC6890 list=not_in_internet
add address=100.64.0.0/10 comment=RFC6890 list=not_in_internet
add address=240.0.0.0/4 comment=RFC6890 list=not_in_internet
add address=192.88.99.0/24 comment=RFC3068 list=not_in_internet
add address=10.10.1.198 comment="Auri's MacOS" list=allowed_to_services
add address=10.10.1.172 comment=AndroidTV list=allowed_to_services
add address=10.10.1.178 comment=IoT_Camera list=no_internet_access