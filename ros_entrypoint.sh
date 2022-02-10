#!/bin/bash
set -ex

# setup ros environment
echo "source '/opt/ros/$ROS_DISTRO/setup.bash' >> ~/.bashrc"
exec "$@"
