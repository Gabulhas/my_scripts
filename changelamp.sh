#/bin/bash
hex=$(xrdb -query | grep '*color1'| awk '{print $NF}' | head -n1  | sed "s/#//")
r=$(printf "%d" 0x${hex:0:2})
g=$(printf "%d" 0x${hex:2:2})
b=$(printf "%d" 0x${hex:4:2})
miiocli yeelight --ip 192.168.1.99 --token e720f3b2eb5ae315f9624348a352f136 set_rgb $r $g $b
