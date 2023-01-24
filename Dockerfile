# This is an auto generated Dockerfile for ros:ros-core
# generated from docker_images/create_ros_core_image.Dockerfile.em
FROM ubuntu:focal  # Install Ubuntu 20.04

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# install basic packages
RUN apt update && apt install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    net-tools \
    pkg-config \
    wget \
    apt-utils \
    build-essential \
    git \
    curl \
    cmake \
    vim \
    && rm -rf /var/lib/apt/lists/*

# install packages for x11 tests
RUN apt update && apt install -y \
    x11-apps \
    mesa-utils\
    && rm -rf /var/lib/apt/lists/*

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list

# setup keys
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_DISTRO noetic

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full \
    && rm -rf /var/lib/apt/lists/*
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Dependencies for building packages
RUN apt install -y --no-install-recommends \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential
RUN rosdep init
RUN rosdep update

# setup entrypoint
COPY ./ros_entrypoint.sh /
RUN bash -c "chmod +x /ros_entrypoint.sh"
RUN apt update

# create user
RUN useradd -ms /bin/bash user01
RUN echo 'user01:newpassword' | chpasswd
RUN adduser user01 sudo
USER user01
WORKDIR /home/user01
CMD ["cp", "/root/.bashrc", "~/"]

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
