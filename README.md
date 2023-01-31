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

### 3. Update .env file
Check the ip address of your host and replace `HOST_IP` with it in `.env` file.
To check ip address,
- windows subsystem for linux (wsl2): ```$ wsl.exe hostname -I```
- mac: ```$ ifconfig```

### 3. Run `docker/build_image.sh` to build the docker image
```bash
bash docker/build_image.sh
```

## Starting the docker container 

### 1. Open a new terminal.

### 2. Run `run_container.sh` and connect to the container
```bash
bash docker/run_container.sh
```

## Connect to the container
### 1. Check if the docker container is running.
```bash
docker container ps -al
```
If you don't see a container whome status is running, make sure that you ran ```bash docker/run_container.sh``` with no error.

### 2. Access to bash in the docker container.
```bash
docker exec -it noetic_ws-dev bash
```
Ctrl + d to exit.

## Installing a new package from apt Repository
Add a package name that you want to install between line 20-25 on Dockerfile.dev and rebuild the docker image with `docker/build_image.sh`
```docker
# Install ros packages
RUN apt update && apt install -y \
    ros-noetic-joy \
    ros-noetic-teleop-twist-joy \
    ros-noetic-moveit
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

## Troubleshooting
If you face a problem, feel free to post an issue on this repository.
- 

## Reference
- https://gist.github.com/vfdev-5/b7685371071036cb739f23b3794b5b83?permalink_comment_id=3533817#gistcomment-3533817
- https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps
- https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285
