# ROS on Mac
I referred [this thread](https://gist.github.com/vfdev-5/b7685371071036cb739f23b3794b5b83?permalink_comment_id=3533817#gistcomment-3533817)
for the ros development on macOS.

## Setup
1. Install Docker ([installation instructions here](https://docs.docker.com/docker-for-mac/install/))
2. Clone this repository
3. Run `docker-compose up --build`

Keep docker-compose running during working on your project.  
Run `Ctrl + C` to stop if you are done with everything.

## Running
1. Open a new terminal.  
2. Run `docker-compose exec ros bash` (`docker-compose up` has to be running)

## User & Password
User: `user01`  
Pass: `newpassword`  

If you want to change a username and passwor, edit `Dockerfile`  

## Testing
4. Run `cd ~/catkin_ws && catkin_make && source devel/setup.bash`
5. Run `rosrun rviz rviz`
6. Open your browser to `localhost:8080/vnc.html` and click connect.
7. RViz is now running in your browser.
