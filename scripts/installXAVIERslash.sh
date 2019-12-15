#!/bin/bash
# Setup the github/mit-racecar/ ROS structure
# Usage installXAVIERslash.sh <dirName>
# dirName defaults to XAVIERslash-ws
# Fetches RACECAR ROS components, installs dependencies, and then catkin_make the workspace

source /opt/ros/melodic/setup.zsh
DEFAULTDIR=~/XAVIERslash-ws
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
if [ -e "$DEFAULTDIR" ] ; then
  echo "$DEFAULTDIR already exists; no action taken"
  echo "Placing XAVIERslash code into $DEFAULTDIR" 
else 
  echo "$DEFAULTDIR does not exist; Setting up Workspace."
  mkdir -p ${DEFAULTDIR}/src
  cd ${DEFAULTDIR}/src
  catkin_init_workspace
  cd ..
  catkin_make
fi
cd "$DEFAULTDIR"

wget -q https://raw.githubusercontent.com/taunusflieger/XAVIERslash-ROS/master/racecar.rosinstall -O "$DEFAULTDIR"/.rosinstall

wstool update

# Install prerequisite packages
echo "Installing prerequisites"
source devel/setup.zsh
# Install the rosdeps -a = all -y = no questions -r = skip errors (for openCV in ZED_Wrapper)
rosdep install -a -y -r
# jstest-gtk is added for testing the joystick
sudo apt-get -y install \
    jstest-gtk 

echo "Catkin Make"
# On the Jetson, there's currently an issue with using the dynamic runtime
# Typically this reports as "cannot find -lopencv_dep_cudart" in the error log
catkin_make config --cmake-args -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF
catkin_make
