#!/bin/bash
ip link set enp39s0 up
ip address add 192.168.178.111/24 dev enp39s0
