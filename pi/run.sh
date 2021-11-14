#!/bin/bash

sudo qmicli -d /dev/cdc-wdm0 --dms-set-operating-mode='online'

wait -n

sudo qmicli -d /dev/cdc-wdm0 --dms-get-operating-mode
wait
sudo qmicli -d /dev/cdc-wdm0 -w
wait
sudo ip link set wwan0 down
wait
echo 'Y' | sudo tee /sys/class/net/wwan0/qmi/raw_ip
wait
sudo ip link set wwan0 up

wait
sudo qmicli -p -d /dev/cdc-wdm0 --device-open-net='net-raw-ip|net-no-qos-header' --wds-start-network="apn='airtelgprs.com',username=' ',password=' ',ip-type=4" --client-no-release-cid
wait

sudo udhcpc -i wwan0
wait
ip a s wwan0
wait
ip r s
wait
