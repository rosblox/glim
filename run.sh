#!/bin/bash

docker run -it --net=bridge \
-v $(pwd)/config:/root/ros2_ws/install/glim/share/glim/config \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY \
mx/glim_ros2_ext:humble
