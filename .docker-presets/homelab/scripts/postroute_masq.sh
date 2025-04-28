#!/bin/sh
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o wlan0 -j MASQUERADE
ip route add 10.8.0.0/24 via 10.8.1.2
