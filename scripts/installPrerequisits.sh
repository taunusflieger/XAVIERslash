##!/bin/bash

ROS_DISTRO=melodic

echo "Installing ROS distro $ROS_DISTRO"
sudo apt-get update

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install -y nano vim vim-runtime tmux screen git curl wget ros-$ROS_DISTRO-desktop-full ros-$ROS_DISTRO-ackermann-msgs python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt update

# Get ROS commands
source /opt/ros/$ROS_DISTRO/setup.zsh

# Install ZED camera sdk
curl -L https://download.stereolabs.com/zedsdk/2.8/jetson_jp42 > /tmp/zedsdk.sh
chmod +x /tmp/zedsdk.sh
sudo /tmp/zedsdk.sh --quiet -- silent

