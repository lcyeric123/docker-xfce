#!/bin/bash
set -e

vncserver -kill :1 >/dev/null 2>&1 || true
rm -rf /root/.vnc/*.pid /root/.vnc/*.log

mkdir -p /root/.vnc
echo "123456" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

Xvnc :1 \
    -geometry 1440x900 \
    -depth 24 \
    -SecurityTypes VncAuth \
    -rfbport 5901 \
    -localhost no \
    -AlwaysShared &

sleep 1.5

export DISPLAY=:1
exec startxfce4
