#!/bin/bash

# Cleanup Debian.
# # Removing leftover leases and persistent rules
# echo "cleaning up dhcp leases"
# rm /var/lib/dhcp/*

# # Make sure Udev doesn't block our network
# echo "cleaning up udev rules"
# rm /etc/udev/rules.d/70-persistent-net.rules
# mkdir /etc/udev/rules.d/70-persistent-net.rules
# rm -rf /dev/.udev/
# rm /lib/udev/rules.d/75-persistent-net-generator.rules

# echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
# echo "pre-up sleep 2" >> /etc/network/interfaces

# Cleanup Centos.
# Remove traces of mac address from network configuration
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth0
#rm /etc/udev/rules.d/70-persistent-net.rules
