#/bin/sh
#################################################################
#
# Script Name : vnc-startup.sh
# Description : Perform an automated install of X11Vnc
# Configure it to run at startup of the machine
# Date : Feb 2016
# Written by : Griffon
# Web Site :http://www.c-nergy.be - http://www.c-nergy.be/blog
# Version : 1.0
# Disclaimer : Script provided AS IS. Use it at your own risk....
#################################################################

#​ Step 1 - Install X11VNC
#​ ​#################################################################
sudo apt-get install x11vnc -y

#​ Step 2 - Specify Password to be used ​ for​ VNC Connection
#​ ​#################################################################
sudo x11vnc -storepasswd /etc/x11vnc.pass

#​ Step 3 - Create the Service Unit File
#​ ​ #################################################################
sudo cat > /lib/systemd/system/x11vnc.service << EOF
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat
-rfbauth /etc/x11vnc.pass -rfbport 5900 -shared

[Install]
WantedBy=multi-user.target
EOF

#​ Step 4 -Configure the Service
#​ ​################################################################
echo "Configure Services"
sudo systemctl enable x11vnc.service
sudo systemctl daemon-reload
sleep 5s
#sudo shutdown -r now