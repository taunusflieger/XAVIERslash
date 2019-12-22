##!/bin/bash
# scripts needs to run as sudo

# Install development tools
apt update
apt install -y build-essential clang cmake apt-utils nano vim vim-runtime tmux screen git curl wget

# Install ROS
ROS_DISTRO=melodic

echo "Installing ROS distro $ROS_DISTRO"
apt-get update

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
apt update
apt install -y  ros-$ROS_DISTRO-desktop-full ros-$ROS_DISTRO-ackermann-msgs python-rosinstall python-rosinstall-generator python-wstool 
apt update

# Get ROS commands
source /opt/ros/$ROS_DISTRO/setup.bash

# Install pip for Python 2.7 and 3.6
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py
apt install python3-pip -y


# Install jetson-stats tool set
pip install -U jetson-stats

# Install Joystick support
apt install -y joystick

# Install 
echo "Installing ZED SDK"

# Install ZED camera sdk
curl -L https://download.stereolabs.com/zedsdk/2.8/jetson_jp42 > /tmp/zedsdk.sh
chmod +x /tmp/zedsdk.sh
/tmp/zedsdk.sh --quiet -- silent

# Remove Office installation
apt remove --purge -y libreoffice*
apt remove --purge -y gnome-2048 aisleriot atomix gnome-chess five-or-more hitori iagno gnome-klotski lightsoff gnome-mahjongg gnome-mines gnome-nibbles quadrapassel four-in-a-row gnome-robots gnome-sudoku swell-foop tali gnome-taquin gnome-tetravex
apt clean
apt autoremove -y

