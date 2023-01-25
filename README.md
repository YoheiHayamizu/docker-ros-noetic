# ROS on Docker
Development environemnt for [ROS Noetic](http://wiki.ros.org/noetic) on a docker container.

## Setup
### 1. Install Docker ([installation instructions are here](https://docs.docker.com/get-docker/))

### 2. Clone this repository
```bash
mkdir -p ~/catkin_ws/src
cd catkin_ws
git clone git@github.com:YoheiHayamizu/docker-ros-noetic.git docker
```

### 3. Run `docker/build_image.sh`
```bash
bash docker/build_image.sh
```

## Running

### 1. Open a new terminal.

### 2. Run `run_container.sh`
```bash
bash docker/run_container.sh
```

## Installing a new package from apt Repository
Add a package name that you want to install between line 4-19 on Dockerfile.dev.
```docker
RUN apt update && apt install -y --no-install-recommends \
    ...
    ros-noetic-joy \
    ros-noetic-teleop-twist-joy \
    ros-noetic-moveit \
    ...
    && rm -rf /var/lib/apt/lists/*
```

**Note:** The packages you installed during development will be removed from your docker container after the container is removed.

## GUI
Launch X server to use GUI.

### Windows
Follow the instructions [here](https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps)

### Mac
1. From the XQuartz preferences, in the security tab, make sure Allow connections from network clients is enabled. Restart XQuartz.
2. In a terminal on the host, run xhost +localhost.
3. Pass -e DISPLAY=host.docker.internal:0 to any docker image you want to forward X to the host.
4. Run your application from your docker container.

## Reference
- https://gist.github.com/vfdev-5/b7685371071036cb739f23b3794b5b83?permalink_comment_id=3533817#gistcomment-3533817
- https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps
- https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285
