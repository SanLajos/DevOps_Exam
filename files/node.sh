#!/bin/bash

curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
yum install -y gcc-c++ make -y nodejs -y
yum install nodejs -y

npm install supervisor -g

mkdir /nodejs
mv /tmp/index.js /nodejs/index.js

echo "[Unit]
Description=Node.JS Systemd Unit file with Supervisor listener
Documentation=no any
After=network.target
[Service]
Environment=NODE_PORT=6543
Type=simple
User=root
ExecStart=/bin/supervisor --watch /nodejs/ /nodejs/index.js
Restart=on-failure
[Install]
WantedBy=multi-user.target" > /lib/systemd/system/nodejs.service

systemctl daemon-reload
systemctl enable --now nodejs