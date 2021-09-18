#!/bin/sh

sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt install ros-galactic-desktop

echo "source /opt/ros/galactic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt update
sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update

sudo apt install -y libpython3-dev python3-pip

mkdir -p ~/ros2_ws/src
cd ros2_ws/
colcon build