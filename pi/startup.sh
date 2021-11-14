#!/bin/bash
export LOCALAPPDATA="LOCALAPPDATA"
screen -L -Logfile vehicle_proxy.log -S vehicle_proxy -d -m bash -c "mavproxy.py --force-connected --master=/dev/ttyAMA0,115200 --out 100.96.1.3:14450 --daemon"

